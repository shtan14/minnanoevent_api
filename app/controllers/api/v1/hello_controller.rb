class Api::V1::HelloController < ApplicationController
  def index
    render json: "Hellooooooo"
  end
end
