class ApplicationMailer < ActionMailer::Base
  # TODO: 環境変数にするか消去
  default from: "example@example.com"
  layout "mailer"
end
