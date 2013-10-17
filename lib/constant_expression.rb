class ConstantExpression < Object

  def self.parse(array)
    self.new(array[1])
  end

  def initialize(value)
    @value = value
  end

  def build_arel(arel_table)
    @value
  end

end