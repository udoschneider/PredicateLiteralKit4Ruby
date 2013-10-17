class Object

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

  def build_arel(arel_table)
    raise "Subclass"
  end

end