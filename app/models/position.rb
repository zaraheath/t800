class Position
  attr_reader :x, :y

  def initialize(positions)
    @x = positions[:x].to_i
    @y = positions[:y].to_i
  end

  def total_distance
    Math.hypot(x, y)
  end
end
