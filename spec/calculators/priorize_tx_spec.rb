require 'rails_helper'

describe PriorizeTX do
  let(:input) do
    [
      Radar.new(position: { x: 0, y: 80 }, targets: [{ type: 'T7-T', damage: 20 }]),
      Radar.new(position: { x: 0, y: 90 }, targets: [{ type: 'T-X', damage: 20 }]),
      Radar.new(position: { x: 0, y: 20 }, targets: [{ type: 'T-X', damage: 20 }]),
      Radar.new(position: { x: 0, y: 50 }, targets: [{ type: 'T1', damage: 30 }, { type: 'T7-T', damage: 30 }])
    ]
  end

  describe 'filter' do
    subject { described_class.new(input).filter }

    it { expect(subject).to eq input.at(1) }
  end
end
