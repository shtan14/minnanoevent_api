class Api::V1::EventImagesController < ApplicationController
  # TODO 開発時xhr_request?を無効化。最後は有効化させる。
  skip_before_action :xhr_request?, only: [:index]
  def index
    event = Event.find(params[:event_id])
    event_images = event.event_images
    render json: event_images
  end
end
