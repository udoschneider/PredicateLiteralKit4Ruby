class FunctionExpression

  def self.parse(array)
    self.new(array[1], array[2..-1])
  end

  def initialize(function, arguments)
    @function = function
    @arguments = arguments.map { |each| PredicateLiteral.parse(each) }
  end

  def build_arel(arel_table)
    arguments = @arguments.map { |each| each.build_arel(arel_table) }
    case @function
      # when "sum:"
      when "count:"
        return arguments.first.count()
      # when "min:"
      # when "max:"
      # when "average:"
      when "first:"
        object = @arguments.first.build_arel(arel_table)
        raise "first:(#{object}) not supported by Arel"
        return object

      when "last:"
        object = @arguments.first.build_arel(arel_table)
        raise "last::(#{object}) not supported by Arel"
        return object

      when "fromObject:index:"
        object = @arguments.first.build_arel(arel_table)
        index = @arguments.second.build_arel (arel_table)
        raise "fromObject:(#{object})index:(#{index}) not supported by Arel"
        return object[index]

      when "add:to:"
        return arguments.reduce(:+)

      when "from:substract:"
        return arguments.reduce(:-)

      when "multiply:by:"
        return arguments.reduce(:*)

      when "divide:by:"
        return arguments.reduce(:/)

      # when "sqrt:"

      when "raise:to:"
        return arguments.reduce(:**)

      # when "abs:"
      # when "now:"
      # when "ln:"
      # when "exp:"
      # when "ceiling:"
      # when "random:"
      # when "modulus:by:"
      # when "chs:"

      else
        raise "Unknown function #{@function} #{arguments}"
    end
  end

end