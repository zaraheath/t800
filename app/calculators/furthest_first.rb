class FurthestFirst < AttackMode
  def filter
    sort_by_distance.last
  end

  def parse
    DamageParser.new(filter).to_json
  end
end
