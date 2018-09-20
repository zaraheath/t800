class TXParser
  attr_reader :radar

  def initialize(radar)
    @radar = radar
  end

  def targets_by_type
    tx_target + other_targets
  end

  def tx_target
    radar.targets.select(&:tx?)
  end

  def other_targets
    radar.targets.reject(&:tx?).sort_by(&:type)
  end

  def to_json
    {
      position: {
        x: radar.position.x,
        y: radar.position.y
      },
      targets: targets_by_type.map(&:to_json)
    }
  end
end
