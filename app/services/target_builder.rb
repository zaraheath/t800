class TargetBuilder
  attr_reader :targets_params

  def initialize(targets_params)
    @targets_params = targets_params
  end

  def build
    if targets_params.is_a?(Array)
      build_targets_array
    else
      build_target
    end
  end

  def build_targets_array
    targets_params.map { |target_params| Target.new(target_params) }.select(&:valid?)
  end

  def build_target
    target = Target.new(targets_params)
    return [] unless target.valid?

    [target]
  end
end
