require "rails_helper"

RSpec.describe Api::V1::AuthTokenController do
  include ActiveSupport::Testing::TimeHelpers
  before do
    @user = active_user
    @params = { auth: { email: @user.email, password: "password" } }
    @access_lifetime = UserAuth.access_token_lifetime
    @refresh_lifetime = UserAuth.refresh_token_lifetime
    @session_key = UserAuth.session_key.to_s
    @access_token_key = "token"
  end

  def refresh_api
    post api("/auth_token/refresh"), xhr: true
  end

  def response_check_of_invalid_request(status, error_msg = nil)
    expect(response.status).to eq(status)
    @user.reload
    expect(@user.refresh_jti).to be_nil

    if error_msg.nil?
      expect(response.body).to be_blank
    else
      expect(res_body["error"]).to eq(error_msg)
    end
  end

  describe "有効なログイン" do
    before do
      login(@params)
      expect(response).to have_http_status(:ok)
      @access_lifetime_to_i = @access_lifetime.from_now.to_i
      @refresh_lifetime_to_i = @refresh_lifetime.from_now.to_i
    end

    it "jtiが保存されていること" do
      @user.reload
      expect(@user.refresh_jti).not_to be_nil
    end

    it "レスポンスのユーザーIDが正しいこと" do
      expect(res_body["user"]["id"]).to eq @user.id
    end

    it "レスポンスの有効期限が想定通りであること" do
      expect(res_body["expires"]).to be_within(1).of(@access_lifetime_to_i)
    end

    it "access_tokenが正しくデコードされ、ユーザーと期限が一致していること" do
      access_token = User.decode_access_token(res_body[@access_token_key])
      expect(access_token.entity_for_user).to eq @user

      token_exp = access_token.payload["exp"]
      expect(res_body["expires"]).to eq token_exp
    end

    it "cookieの設定が想定通りであること" do
      cookie = @request.cookie_jar.instance_variable_get(:@set_cookies)[@session_key]
      expect(cookie[:expires].to_i).to be_within(1.second).of(Time.at(@refresh_lifetime_to_i).to_i)
      expect(cookie[:secure]).to eq Rails.env.production?
      expect(cookie[:http_only]).to be_truthy
    end

    it "refresh_tokenが正しくデコードされ、ユーザー、jti、および有効期限が一致していること" do
      token_from_cookies = cookies[@session_key]
      refresh_token = User.decode_refresh_token(token_from_cookies)
      @user.reload

      expect(refresh_token.entity_for_user).to eq @user
      expect(refresh_token.payload["jti"]).to eq @user.refresh_jti
      expect(refresh_token.payload["exp"]).to eq @refresh_lifetime_to_i
    end
  end

  describe "無効なログイン" do
    it "不正なユーザーの場合エラーを返すこと" do
      pass = "password"
      invalid_params = { auth: { email: @user.email, password: "#{pass}a" } }
      login(invalid_params)
      response_check_of_invalid_request(404)
    end

    it "アクティブユーザーでない場合エラーを返すこと" do
      pass = "password"
      inactive_user = User.create(name: "a", email: "a@a.a", password: pass)
      invalid_params = { auth: { email: inactive_user.email, password: pass } }
      expect(inactive_user.activated).to be_falsey
      login(invalid_params)
      response_check_of_invalid_request(404)
    end

    it "Ajax通信ではない場合エラーを返すこと" do
      post api("/auth_token"), params: @params
      response_check_of_invalid_request(403, "Forbidden")
    end
  end

  describe "有効なリフレッシュ" do
    context "refreshアクションからの有効なリフレッシュ" do
      before do
        # 有効なログイン
        login(@params)
        expect(response).to have_http_status(:ok)
        @user.reload
        @old_access_token = res_body[@access_token_key]
        @old_refresh_token = cookies[@session_key]
        @old_user_jti = @user.refresh_jti
      end

      it "古いトークンとjtiがnilでないこと" do
        expect(@old_access_token).not_to be_nil
        expect(@old_refresh_token).not_to be_nil
        expect(@old_user_jti).not_to be_nil
      end

      it "新しいトークンとjtiが発行されていること" do
        refresh_api
        expect(response).to have_http_status(:ok)
        @user.reload
        new_access_token = res_body[@access_token_key]
        new_refresh_token = cookies[@session_key]
        new_user_jti = @user.refresh_jti

        expect(new_access_token).not_to be_nil
        expect(new_refresh_token).not_to be_nil
        expect(new_user_jti).not_to be_nil

        expect(@old_access_token).not_to eq new_access_token
        expect(@old_refresh_token).not_to eq new_refresh_token
        expect(@old_user_jti).not_to eq new_user_jti
      end

      it "user.refresh_jtiが最新のjtiと一致していること" do
        new_refresh_token = cookies[@session_key]
        payload = User.decode_refresh_token(new_refresh_token).payload
        expect(payload["jti"]).to eq @user.refresh_jti
      end
    end
  end

  describe "無効なリフレッシュ" do
    it "refresh_tokenが存在しない場合はアクセスできないこと" do
      refresh_api
      response_check_of_invalid_request 401
    end

    it "2回ログインを行ったあと古いrefresh_tokenでアクセスするとエラーを返すこと" do
      # 1つ目のブラウザでログイン
      login(@params)
      expect(response).to have_http_status(:ok)
      old_refresh_token = cookies[@session_key]

      # 2つ目のブラウザでログイン
      login(@params)
      expect(response).to have_http_status(:ok)

      # cookieに古いrefresh_tokenをセット
      cookies[@session_key] = old_refresh_token
      expect(cookies[@session_key]).not_to be_blank

      # 1つ目のブラウザ(古いrefresh_token)でアクセス
      refresh_api
      expect(response).to have_http_status(:unauthorized)

      # cookieは削除されているか
      expect(cookies[@session_key]).to be_blank
    end

    it "有効期限後はアクセスが失敗すること" do
      travel_to(@refresh_lifetime.from_now) do
        refresh_api
        expect(response).to have_http_status(:unauthorized)
        expect(response.body).to be_blank
      end
    end
  end

  describe "ログアウト機能の確認" do
    before do
      # 有効なログイン
      login(@params)
      expect(response).to have_http_status(:ok)
      @user.reload
    end

    it "有効なログアウトができること" do
      expect(@user.refresh_jti).not_to be_nil
      expect(cookies[@session_key]).not_to be_blank

      logout
      expect(response).to have_http_status(:ok)

      # cookieが削除されているか
      expect(cookies[@session_key]).to be_blank

      # userのjtiが削除されているか
      @user.reload
      expect(@user.refresh_jti).to be_nil

    # sessionがない状態でログアウトしたらエラーが返ってくるか
      cookies[@session_key] = nil
      logout
      response_check_of_invalid_request 401
    end

    context "session有効期限後のログアウト" do
      before do
        # 有効なログイン
        login(@params)
        expect(response).to have_http_status(:ok)
        expect(cookies[@session_key]).not_to be_blank
      end

      it "有効期限後にログアウトするとエラーが返ること" do
        travel_to(@refresh_lifetime.from_now) do
          logout
          expect(response).to have_http_status(:unauthorized)
          # cookieが削除されているか
          expect(cookies[@session_key]).to be_blank
        end
      end
    end
  end
end
