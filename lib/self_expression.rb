class SelfExpression

  def self.singleton()
    @@singleton ||= self.new()
  end

  def build_arel(arel_table)
    raise "SELF not supported in arel"
  end

end