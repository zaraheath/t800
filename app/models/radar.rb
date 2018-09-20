class Radar
  attr_reader :position, :targets, :attributes

  def initialize(attributes)
    @attributes = attributes
    @position = Position.new(attributes[:position])
    @targets = TargetBuilder.new(attributes[:targets]).build
  end

  def total_distance
    position.total_distance
  end

  def has_tx?
    targets.select(&:tx?).any?
  end

  def human?
    targets.select(&:human?).any?
  end
end
