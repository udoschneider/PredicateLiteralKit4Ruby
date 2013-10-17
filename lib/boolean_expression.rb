class BooleanExpression < Object

  def initialize(value)
    @value = value
  end

  def build_arel(arel_table)
    return @value ? Arel::Nodes::True.new() : Arel::Nodes::False.new()
  end

  TRUE = BooleanExpression.new(true)
  FALSE = BooleanExpression.new(false)

end