class Api::V1::AccountActivationsController < ApplicationController
  skip_before_action :xhr_request?, only: [:edit]
  def edit
    user = User.find_by(email: params[:email])
    if user && !user.activated? && user.authenticated?(:activation, params[:id])
      user.update(activated: true, activated_at: Time.zone.now)
      render json: { message: "アカウントが有効になりました。" }, status: :ok
    else
      render json: { error: "無効なアクティベーションリンクです。" }, status: :unprocessable_entity
    end
  end
end
