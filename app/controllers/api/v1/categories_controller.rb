class Api::V1::CategoriesController < ApplicationController
  # TODO 開発時xhr_request?を無効化。最後は有効化させる。
  skip_before_action :xhr_request?, only: [:index]
  # カテゴリー一覧を取得
  def index
    categories = Category.all
    render json: categories
  end
end
