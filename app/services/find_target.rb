class FindTarget
  attr_reader :attack_modes, :radars

  def initialize(attack_modes, radars)
    @attack_modes = attack_modes
    @radars = radars.map { |radar_params| ::Radar.new(radar_params) }
  end

  def calculate
    parse_class = attack_modes.shift
    attack_modes.each do |am|
      @radars = attack_mode_class(am).new(radars).filter
    end
    attack_mode_class(parse_class).new(radars).parse
  end

  private

  def attack_mode_class(am)
    am.gsub('-','_').classify.constantize
  end
end

