require "rails_helper"
require "spec_helper"

RSpec.describe UserMailer do
  describe "アカウント認証メール" do
    let(:demo_user) { create(:demo_user) }  # デモユーザーを作成
    let(:mail) { UserMailer.account_activation(demo_user) }

    it "メールのヘッダー表記が適切であること" do
      expect(mail.subject).to eq("【みんなのイベント】アカウント認証をお願いします")
      expect(mail.to).to eq([demo_user.email])
      expect(mail.from).to eq(["mg.minnanoevent.com"])
    end

    it "メールの本文表記が適切であること" do
      html_part = mail.body.parts.find { |p| p.content_type.include?("html") }
      text_part = mail.body.parts.find { |p| p.content_type.include?("plain") }
      expect(html_part.body.decoded).to match(demo_user.name)
      expect(text_part.body.decoded).to match(demo_user.name)
      expect(html_part.body.decoded).to match(demo_user.activation_token)
      expect(text_part.body.decoded).to match(demo_user.activation_token)
      expect(html_part.body.decoded).to match(CGI.escape(demo_user.email))
      expect(text_part.body.decoded).to match(CGI.escape(demo_user.email))
    end
  end
end
