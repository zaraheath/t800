class PriorizeTX < AttackMode
  def filter
    radars.select(&:has_tx?).first
  end

  def parse
    TXParser.new(filter).to_json
  end
end
