class Api::V1::FavouritesController < ApplicationController
  # TODO: 開発時xhr_request?を無効化。最後は有効化させる。
  skip_before_action :xhr_request?, only: %i[create destroy]
  before_action :authenticate_user

  def index
    favourites = current_user.favourites
    render json: favourites
  end

  def create
    favourite = current_user.favourites.build(event_id: params[:event_id])
    if favourite.save
      render json: favourite, status: :created
    else
      render json: favourite.errors, status: :unprocessable_entity
    end
  end

  def destroy
    favourite = current_user.favourites.find_by(id: params[:id])
    if favourite&.destroy
      head :no_content
    else
      render json: { error: "Not Found" }, status: :not_found
    end
  end
end
