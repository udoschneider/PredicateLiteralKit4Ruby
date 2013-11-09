require "PredicateLiteralKit4Ruby/version"

LITERAL_KEY_MAPPING = {}

module PredicateLiteral

  require "expression"
  require "predicate"

  def self.parse(array)
    type = array[0]
    case (type)
      when "cmd"
        return CompoundPredicate.parse(array)
      when "cmp"
        return ComparisonPredicate.parse(array)
      when "agr"
        return AggregateExpression.parse(array)
      when "key"
        return KeypathExpression.parse(array)
      when "con"
        return ConstantExpression.parse(array)
      when true
        return BooleanExpression::TRUE
      when false
        return BooleanExpression::FALSE
      when "slf"
        return SelfExpression::singleton
      when "fn"
        return FunctionExpression.parse(array)
      when "var"
        return VariableExpression.parse(array)
      else
        raise "Unknown Predicate type (#{array.inspect})!"
    end
  end

end

module SortDescriptorLiteral

  def self.parse(array)
    array.map do |each|
      SortDescriptor.parse(each)
    end
  end

  class SortDescriptor

    attr_reader :key, :selector, :ascending

    def self.parse(array)
      self.new(array[0], array[1], array[2])
    end

    def initialize(key, selector, ascending)
      @key = key
      @selector = selector
      @ascending = ascending
    end

    def underscore(camel_cased_word)
      camel_cased_word.to_s.gsub(/::/, '/').
          gsub(/([A-Z]+)([A-Z][a-z])/, '\1_\2').
          gsub(/([a-z\d])([A-Z])/, '\1_\2').
          tr("-", "_").
          downcase
    end

    def build_arel(arel_table)
      key = underscore(@key) unless (key = LITERAL_KEY_MAPPING[@key])
      key = key.to_sym
      puts "KEY: #{key}"
      return arel_table[key].asc if @ascending
      return arel_table[key].desc
    end

  end

end