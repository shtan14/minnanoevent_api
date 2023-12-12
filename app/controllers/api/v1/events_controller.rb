class Api::V1::EventsController < ApplicationController
  # TODO: 開発時xhr_request?を無効化。最後は有効化させる。
  skip_before_action :xhr_request?, only: %i[index show]
  before_action :authenticate_user, only: %i[create destroy update]

  def index
    events = fetch_events
    render json: format_events(events), include: %i[categories event_images]
  end

  def show
    event = Event.includes(:categories, :event_images).find(params[:id])
    formatted_event = format_event(event)
    render json: formatted_event, include: %i[categories event_images]
  end

  def create
    ActiveRecord::Base.transaction do
      @event = current_user.events.build(event_params)
      @event.save!

      save_event_images(@event) if params[:image_urls].present?
      assign_categories(@event) if params[:category_ids].present?
    end

    render json: @event, status: :created
  rescue ActiveRecord::RecordInvalid => e
    render json: { errors: e.record.errors.full_messages }, status: :unprocessable_entity
  end

  def update
    event = Event.find(params[:id])

    # イベントの所有者かどうかをチェック
    if event.user != current_user
      return render json: { errors: ["更新権限がありません。"] }, status: :forbidden
    end

    ActiveRecord::Base.transaction do
      event.update!(event_params)

      # 画像を更新（既存の画像を削除し、新しいURLを保存）
      event.event_images.destroy_all
      save_event_images(event) if params[:image_urls].present?
      # カテゴリーを更新
      event.categories.destroy_all
      assign_categories(event) if params[:category_ids].present?
    end

    render json: event, include: %i[categories event_images], status: :ok
  rescue ActiveRecord::RecordInvalid => e
    render json: { errors: e.record.errors.full_messages }, status: :unprocessable_entity
  end

  def destroy
    event = Event.find(params[:id])
    # イベントの所有者かどうかをチェック
    if event.user == current_user
      event.destroy
      render json: { message: "イベントが削除されました。" }, status: :ok
    else
      render json: { errors: ["削除権限がありません。"] }, status: :forbidden
    end
  end

  private

    def save_event_images(event)
      params[:image_urls].each do |url|
        event.event_images.create!(event_image: url)
      end
    end

    def assign_categories(event)
      params[:category_ids].each do |category_id|
        event.categories << Category.find(category_id)
      end
    end

    def fetch_events
      base_query = Event.includes(:categories, :event_images)
      if params[:user_id]
        # 特定のユーザーに紐づくイベントのみを取得 開始日が本日のイベントは全部取得
        base_query.where(user_id: params[:user_id])
                  .where("event_start_datetime >= ?", Time.zone.now.beginning_of_day)
                  .order(event_start_datetime: :asc)
      else
        # 開始日時が近い順に全イベントを取得 開始日が本日のイベントは全部取得
        base_query.where("event_start_datetime >= ?", Time.zone.now.beginning_of_day)
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

    def event_params
      # 適切なパラメータを許可
      params.require(:event).permit(:title, :description, :prefecture, :city, :location, :ticket_price, :phone_number, :event_start_datetime, :event_end_datetime, image_urls: [], category_ids: [])
    end
end
