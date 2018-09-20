class AvoidCrossfire < AttackMode
  def filter
    radars.reject(&:human?)
  end

  def parse
    ClosestFirst.new(filter).parse
  end
end
