class DamageParser
  attr_reader :radar

  def initialize(radar)
    @radar = radar
  end

  def targets_by_damage
    radar.targets.reject(&:human?).sort_by(&:damage).reverse
  end

  def to_json
    {
      position: {
        x: radar.position.x,
        y: radar.position.y
      },
      targets: targets_by_damage.map(&:to_json)
    }
  end
end
