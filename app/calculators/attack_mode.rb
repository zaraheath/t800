class AttackMode
  attr_reader :radars

  def initialize(radars)
    @radars = radars
  end

  protected

  def sort_by_distance
    radars.sort_by(&:total_distance)
  end
end
