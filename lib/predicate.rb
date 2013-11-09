class Predicate

  def build_arel(arel_table)
    raise "Subclass"
  end

  require "predicates/compound_predicate"
  require "predicates/comparison_predicate"
end