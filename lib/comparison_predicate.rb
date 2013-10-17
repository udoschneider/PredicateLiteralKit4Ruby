class ComparisonPredicate < Object

  def self.parse(array)
    self.new(array[1], array[2], array[3], array[4], array[5])
  end

  def initialize(operator, lhs, rhs, options = [], modifier = "")
    @operator = operator
    @lhs = PredicateLiteral.parse(lhs)
    @rhs = PredicateLiteral.parse(rhs)
    @options = options
    @modifer = modifier
  end

  def build_arel(arel_table)
    lhs = @lhs.build_arel(arel_table)
    rhs = @rhs.build_arel(arel_table)
    case @operator
      when "=="
        # The left-hand expression is equal to the right-hand expression.
        return lhs.eq(rhs)

      when ">="
        # The left-hand expression is greater than or equal to the right-hand expression.
        return lhs.gteq(rhs)

      when "<="
        # The left-hand expression is less than or equal to the right-hand expression.
        return lhs.lteq(rhs)

      when ">"
        # The left-hand expression is greater than the right-hand expression.
        return lhs.gt(rhs)

      when "<"
        # The left-hand expression is less than the right-hand expression.
        return lhs.lt(rhs)

      when "!="
        # The left-hand expression is not equal to the right-hand expression.
        return lhs.not_eq(rhs)

      when "BEGINSWITH"
        # The left-hand expression begins with the right-hand expression.
        return lhs.matches("%#{rhs}")

      when "CONTAINS"
        # The left-hand expression contains the right-hand expression.
        return lhs.matches("%#{rhs}%")

      when "ENDSWITH"
        # The left-hand expression ends with the right-hand expression.
        return lhs.matches("#{rhs}%")

      when "LIKE"
        # The left hand expression equals the right-hand expression: ? and * are allowed as wildcard characters,
        # where ? matches 1 character and * matches 0 or more characters.
        return lhs.matches(rhs.tr("*?", "%_"))

      when "MATCHES"
        # The left hand expression equals the right hand expression using a regex-style comparison according to
        # ICU v3 (for more details see the ICU User Guide for Regular Expressions).
        raise "MATCHES Operator (RegExps) not supported!"

      when "IN"
        return lhs.in(rhs)

      else
        raise "Unknown Operator #{@operator}"
    end
  end

end