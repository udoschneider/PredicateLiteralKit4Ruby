require "PredicateLiteralKit4Ruby/version"

module PredicateLiteral

  require "expression"
  require "keypath_expression"
  require "variable_expression"
  require "constant_expression"
  require "function_expression"
  require "self_expression"
  require "boolean_expression"
  require "aggregate_expression"

  require "predicate"
  require "compound_predicate"
  require "comparison_predicate"

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