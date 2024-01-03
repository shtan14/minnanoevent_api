class UserMailer < ApplicationMailer
  def account_activation(user)
    @user = user
    mail(to: @user.email, subject: "【みんなのイベント】アカウント認証をお願いします", from: "みんなのイベント")
  end

  def password_reset
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
