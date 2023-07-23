module Api
  module V1
    class HealthcheckController < ApplicationController
      def index
        head :ok
      end
    end
  end
end
