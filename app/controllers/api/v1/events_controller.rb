class Api::V1::EventsController < ApplicationController
  # TODO 開発効率UPのためxhr_request?を無効化。最後は有効化させる。
  skip_before_action :xhr_request?, only: [:index]
  def index
    events = Event.all
    render json: events
  end
end
