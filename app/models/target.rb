class Target
  attr_reader :type, :damage

  TYPES = ['Human', 'T1', 'T1-9', 'T7-T', 'T-X', 'HK Airstrike', 'HK-Bomber', 'HK-Tank'].freeze

  def initialize(target_params)
    @type = target_params[:type]
    @damage = target_params[:damage]&.to_i || 0
  end

  def human?
    type == 'Human'
  end

  def tx?
    type == 'T-X'
  end

  def valid?
    TYPES.include?(type)
  end

  def to_json
    type
  end
end
