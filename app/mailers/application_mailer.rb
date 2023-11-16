class ApplicationMailer < ActionMailer::Base
  # TODO: 環境変数にする
  default from: "wrzn.inw.snun@gmail.com"
  layout "mailer"
end
