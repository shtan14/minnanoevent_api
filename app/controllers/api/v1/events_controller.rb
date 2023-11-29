class Api::V1::EventsController < ApplicationController
  # TODO: 開発時xhr_request?を無効化。最後は有効化させる。
  skip_before_action :xhr_request?, only: %i[index show]

  def index
    events = fetch_events
    render json: format_events(events), include: %i[categories event_images]
  end

  def show
    event = Event.includes(:categories, :event_images).find(params[:id])
    formatted_event = format_event(event)
    render json: formatted_event, include: %i[categories event_images]
  end

  private

    # クエリパラメータにuser_idがある場合は、そのユーザーに紐づくイベントのみを取得
    def fetch_events
      if params[:user_id]
        Event.includes(:categories, :event_images).where(user_id: params[:user_id])
      else
        Event.includes(:categories, :event_images).all
      end
    end

    # カテゴリー、イベントイメージ、isFavourite、favouriteIdを含んだ全件イベントデータを取得
    def format_events(events)
      events.map do |event|
        event.as_json(include: %i[categories event_images]).merge(
          isFavourite: event.favourite_for?(current_user),
          favouriteId: event.favourite_id_for(current_user)
        )
      end
    end

    # カテゴリー、イベントイメージ、isFavourite、favouriteIdを含んだ個別イベントデータを取得
    def format_event(event)
      event.as_json(
        include: %i[categories event_images]
      ).merge(
        isFavourite: event.favourite_for?(current_user),
        favouriteId: event.favourite_id_for(current_user)
      )
    end
end
