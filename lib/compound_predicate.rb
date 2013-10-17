class CompoundPredicate < Object

  def self.parse(array)
    self.new(array[1], array[2..-1])
  end

  def initialize(operator, subpredicates)
    @operator = operator
    @subpredicates = subpredicates.map { |each| PredicateLiteral.parse(each) }
  end

  def build_arel(arel_table)
    return BooleanExpression::TRUE.build_arel(arel_table) if @subpredicates.empty?

    lhs = @subpredicates.first.build_arel(arel_table)
    case @operator
      when "&"
        @subpredicates[1..-1].each do |each|
          rhs = each.build_arel(arel_table)
          lhs = lhs.and(rhs)
        end
      when "|"
        @subpredicates[1..-1].each do |each|
          rhs = each.build_arel(arel_table)
          lhs = lhs.or(rhs)
        end
      when "!"
        lhs = lhs.not()
      else
        raise "Unknown operator #{@operator}"
    end
    lhs
  end
end