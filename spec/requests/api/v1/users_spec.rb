require "rails_helper"

RSpec.describe "Api::V1::Users" do
  describe "GET /show" do
    let(:user) { create(:demo_user) }

    it "想定通りのユーザープロフィールを返すこと" do
      get "/api/v1/users/#{user.id}"
      expect(response).to have_http_status(:success)

      expect(res_body["name"]).to eq(user.name)
      expect(res_body["email"]).to eq(user.email)
      expect(res_body["user_profile"]["bio"]).to eq(user.user_profile.bio)
      expect(res_body["user_profile"]["avatar"]).to eq(user.user_profile.avatar)
      expect(res_body["user_profile"]["x_link"]).to eq(user.user_profile.x_link)
      expect(res_body["user_profile"]["facebook_link"]).to eq(user.user_profile.facebook_link)
      expect(res_body["user_profile"]["instagram_link"]).to eq(user.user_profile.instagram_link)
    end
  end

  describe "POST /create" do
    let(:user_params) { attributes_for(:demo_user) }

    it "ユーザーが作成されること" do
      expect {
        post "/api/v1/users", params: { user: user_params }
      }.to change(User, :count).by(1)
    end

    context "無効なパラメータの場合" do
      let(:invalid_params) { { name: "", email: "invalid_email", password: "short" } }

      it "ユーザーが作成されないこと" do
        expect {
          post "/api/v1/users", params: { user: invalid_params }
        }.not_to change(User, :count)

        expect(response).to have_http_status(:unprocessable_entity)
        expect(res_body["errors"]).not_to be_empty
      end
    end
  end
end
