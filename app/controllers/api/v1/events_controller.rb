class Api::V1::EventsController < ApplicationController
  # TODO: 開発時xhr_request?を無効化。最後は有効化させる。
  skip_before_action :xhr_request?, only: %i[index show]
  def index
    # クエリパラメータにuser_idがある場合は、そのユーザーに紐づくイベントのみを取得
    events = if params[:user_id]
               Event.includes(:categories, :event_images).where(user_id: params[:user_id])
             else
               Event.includes(:categories, :event_images).all
             end

    render json: events, include: %i[categories event_images]
  end

  def show
    event = Event.includes(:categories, :event_images).find(params[:id])
    render json: event, include: %i[categories event_images]
  end
end
