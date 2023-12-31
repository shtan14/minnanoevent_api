class AccountActivationsController < ApplicationController
  def edit
    user = User.find_by(email: params[:email])
    if user && !user.activated? && user.authenticated?(:activation, params[:id])
      user.update(activated: true, activated_at: Time.zone.now)
      render json: { message: "アカウントが有効になりました。ログインをお願いいたします。", redirect_url: "/login" }, status: :ok
    else
      render json: { error: "無効なアクティベーションリンクです。", redirect_url: "/login" }, status: :unprocessable_entity
    end
  end
end
