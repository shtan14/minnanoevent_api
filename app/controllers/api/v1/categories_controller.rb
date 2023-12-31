class Api::V1::CategoriesController < ApplicationController
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
