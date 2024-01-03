module Api
  module V1
    class HealthcheckController < ApplicationController
      skip_before_action :xhr_request?, only: [:index]
      def index
        head :ok
      end
    end
  end
end
