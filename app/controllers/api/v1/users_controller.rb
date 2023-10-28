class Api::V1::UsersController < ApplicationController
  # TODO 開発時xhr_request?を無効化。最後は有効化させる。
  skip_before_action :xhr_request?, only: [:index, :show]
  def show
    user = User.includes(:user_profile).find(params[:id])
    render json: user,include: [:user_profile]
  end
end
