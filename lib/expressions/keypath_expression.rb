class KeypathExpression < Object

  def self.parse(array)
    self.new(array[1])
  end

  def initialize(keypath)
    @keypath = keypath
  end

  def build_arel(arel_table)
    result = arel_table
    @keypath.split(".").each do |path|
      result = result[path]
    end
    result
  end

  def keypath
    @keypath
  end

end