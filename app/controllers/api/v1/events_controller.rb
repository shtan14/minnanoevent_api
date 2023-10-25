class Api::V1::EventsController < ApplicationController
  # TODO 開発時xhr_request?を無効化。最後は有効化させる。
  skip_before_action :xhr_request?, only: [:index, :show]
  def index
    events = Event.includes(:categories, :event_images).all
    render json: events, include: [:categories, :event_images]
  end

  def show
    event = Event.includes(:categories, :event_images).find(params[:id])
    render json: event, include: [:categories, :event_images]
  end
end
