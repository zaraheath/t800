module Api
  module V1
    class ObjectivesController < ApplicationController
      def create
        render json: FindTarget.new(attack_mode, radar_params).calculate.to_json
      end

      private

      def attack_mode
        params['attack-mode']
      end

      def radar_params
        params['radar']#.permit(radar: [:position, targets: [:type, :damage]])
      end
    end
  end
end
