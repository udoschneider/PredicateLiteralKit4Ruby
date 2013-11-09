class Expression

  def build_arel(arel_table)
    raise "Subclass"
  end

end

require "expressions/keypath_expression"
require "expressions/variable_expression"
require "expressions/constant_expression"
require "expressions/function_expression"
require "expressions/self_expression"
require "expressions/boolean_expression"
require "expressions/aggregate_expression"