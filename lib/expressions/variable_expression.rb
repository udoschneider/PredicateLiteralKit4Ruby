class VariableExpression < Object

  def self.parse(json)
    self.new(json[1])
  end

  def initialize(variable)
    @variable = variable
  end

  def build_arel(arel_table)
    Object.const_get(@variable)
  end

end