class Predicate

  def build_arel(arel_table)
    raise "Subclass"
  end

end