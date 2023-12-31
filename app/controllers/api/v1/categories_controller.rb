class Api::V1::CategoriesController < ApplicationController
  # TODO: 開発時xhr_request?を無効化。最後は有効化させる。
  skip_before_action :xhr_request?, only: %i[index show]
  # カテゴリー一覧を取得
  def index
    categories = Category.all
    render json: categories
  end

  def show
    category = Category.find(params[:id])
    events = category.events.where("event_start_datetime >= ?", Time.zone.now.beginning_of_day).includes(:categories, :event_images).order(event_start_datetime: :asc)
    render json: events, include: %i[categories event_images]
  end
end
