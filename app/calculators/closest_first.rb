class ClosestFirst < AttackMode
  def filter
    sort_by_distance.first
  end

  def parse
    DamageParser.new(filter).to_json
  end
end
