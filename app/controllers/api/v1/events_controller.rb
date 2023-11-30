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

    def fetch_events
      base_query = Event.includes(:categories, :event_images)
      if params[:user_id]
        # 特定のユーザーに紐づくイベントのみを取得
        base_query.where(user_id: params[:user_id])
                  .where("event_start_datetime >= ?", Time.zone.now)
                  .order(event_start_datetime: :asc)
      else
        # 開始日時が現在または未来で、開始日時が近い順に全イベントを取得
        base_query.where("event_start_datetime >= ?", Time.zone.now)
                  .order(event_start_datetime: :asc)
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
