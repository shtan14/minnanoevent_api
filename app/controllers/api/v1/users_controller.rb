class Api::V1::UsersController < ApplicationController
  # TODO: 開発時xhr_request?を無効化。最後は有効化させる。
  skip_before_action :xhr_request?, only: %i[create show]
  before_action :authenticate_user, only: %i[destroy update]

  def show
    user = User.includes(:user_profile).find(params[:id])
    render json: user, include: [:user_profile]
  end

  def create
    @user = User.new(user_params)
    if @user.save
      UserMailer.account_activation(@user).deliver_now
      render json: { message: "メールを確認しアカウントの認証をお願いいたします。" }, status: :created
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    user = current_user
    if user&.update(user_params)
      render json: user
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    user = current_user
    if user&.destroy
      head :ok
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  # Strong Parametersを使用し、安全なパラメータのみを許可
    def user_params
      params.require(:user).permit(:name, :email, :password)
    end
end
