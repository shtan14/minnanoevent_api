class Api::V1::EventsController < ApplicationController
  # TODO 開発時xhr_request?を無効化。最後は有効化させる。
  skip_before_action :xhr_request?, only: [:index, :show]
  # イベント一覧を取得
  def index
    events = Event.all
    render json: events
  end

  def show
    event = Event.includes(:categories).find(params[:id])
    render json: event, include: "categories"
  end
end
