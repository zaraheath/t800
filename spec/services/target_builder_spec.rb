require 'rails_helper'

describe TargetBuilder do
  subject { described_class.new(input).build }

  context 'array of targets' do
    let(:input) { [{ type: 'T1', damage: 30 }, { type: 'T7-T', damage: 30 }] }

    it { expect(subject.count).to eq 2 }
    it { expect(subject).to be_a(Array) }
  end

  context 'single target' do
    let(:input) { { type: 'T1', damage: 30 } }

    it { expect(subject.count).to eq 1 }
    it { expect(subject).to be_a(Array) }
  end
end
