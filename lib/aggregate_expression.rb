class AggregateExpression < Object

  def self.parse(array)
    self.new(array[1..-1])
  end

  def initialize(collection)
    @collection = collection.map { |each| PredicateLiteral.parse(each) }
  end

  def build_arel(arel_table)
    @collection.map { |each| each.build_arel(arel_table) }
  end

end
