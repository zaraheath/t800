require 'rails_helper'

describe Api::V1::ObjectivesController do
  describe '#create' do
    subject { post :create, params: input_params }

    context 'success' do
      let(:input_params) { JSON.parse('{"attack-mode":["closest-first"],"radar":[{"position":{"x":0,"y":40},"targets":[{"type":"T1","damage":30},{"type":"T-X","damage":80},{"type": "Human"}]},{"position":{"x":0,"y":60},"targets":[{"type":"T-X","damage":80}]}]}') }

      it { expect(subject).to have_http_status(:ok) }
      it { expect(JSON.parse(subject.body)).to eq JSON.parse('{"position":{"x":0,"y":40},"targets":["T-X","T1"]}') }
    end
  end
end
