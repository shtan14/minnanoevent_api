class Api::V1::EventsController < ApplicationController
  # TODO 開発時xhr_request?を無効化。最後は有効化させる。
  skip_before_action :xhr_request?, only: [:index, :show]
  def index
    events = Event.all
    render json: events
  end

  def show
    event = Event.find(params[:id])
    render json: event
  end
end
