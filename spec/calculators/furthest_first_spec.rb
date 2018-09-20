require 'rails_helper'

describe FurthestFirst do
  let(:input) do
    [
      Radar.new(position: { x: 0, y: 20 }, targets: [{ type: 'T-X', damage: 20 }]),
      Radar.new(position: { x: 0, y: 50 }, targets: [{ type: 'T1', damage: 30 }, { type: 'T7-T', damage: 30 }])
    ]
  end

  describe 'filter' do
    subject { described_class.new(input).filter }

    it { expect(subject).to eq input.last }
  end
end
