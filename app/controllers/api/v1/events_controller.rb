class Api::V1::EventsController < ApplicationController
  # TODO 開発時xhr_request?を無効化。最後は有効化させる。
  skip_before_action :xhr_request?, only: [:index, :show]
  def index
    # クエリパラメータにuser_idがある場合は、そのユーザーに紐づくイベントのみを取得
    if params[:user_id]
      events = Event.includes(:categories, :event_images).where(user_id: params[:user_id])
    else
      events = Event.includes(:categories, :event_images).all
    end

    render json: events, include: [:categories, :event_images]
  end

  def show
    event = Event.includes(:categories, :event_images).find(params[:id])
    render json: event, include: [:categories, :event_images]
  end
end
