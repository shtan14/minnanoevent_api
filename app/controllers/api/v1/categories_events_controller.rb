class Api::V1::CategoriesEventsController < ApplicationController
  # イベントにカテゴリーを関連付ける
  def create
    event = Event.find(params[:event_id])
    category = Category.find(params[:category_id])

    if event.categories << category
      render json: { message: "Category added to event successfully" }
    else
      render json: { error: "Failed to add category to event" }, status: :unprocessable_entity
    end
  end

  # イベントからカテゴリーを削除する
  def destroy
    event = Event.find(params[:event_id])
    category = Category.find(params[:category_id])

    if event.categories.delete(category)
      render json: { message: "Category removed from event successfully" }
    else
      render json: { error: "Failed to remove category from event" }, status: :unprocessable_entity
    end
  end
end
