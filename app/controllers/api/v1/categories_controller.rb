class Api::V1::CategoriesController < ApplicationController
  # TODO 開発時xhr_request?を無効化。最後は有効化させる。
  skip_before_action :xhr_request?, only: [:index, :show]
  # カテゴリー一覧を取得
  def index
    categories = Category.all
    render json: categories
  end

  def show
    category = Category.find(params[:id])
    events = category.events.includes(:categories, :event_images)
    render json: events, include: [:categories, :event_images]
  end
end
