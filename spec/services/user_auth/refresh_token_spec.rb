require "rails_helper"

RSpec.describe UserAuth::RefreshToken do
  include ActiveSupport::Testing::TimeHelpers
  before do
    @user = active_user
    @encode = UserAuth::RefreshToken.new(user_id: @user.id)
    @lifetime = UserAuth.refresh_token_lifetime
  end

  describe "エンコード" do
    it "payload[:exp] の値は想定通りであること（1秒の許容範囲内）" do
      payload = @encode.payload
      expect_lifetime = @lifetime.from_now.to_i
      expect(payload[:exp]).to be_within(1).of(expect_lifetime)
    end

    it "payload[:jti] の値は想定通りであること" do
      payload = @encode.payload
      encode_user = @encode.entity_for_user
      expect_jti = encode_user.refresh_jti
      expect(payload[:jti]).to eq(expect_jti)
    end

    it "payload[:sub] の値は正しいユーザー ID であること" do
      payload = @encode.payload
      user_claim = @encode.send(:user_claim)
      expect(payload[user_claim]).to eq(@encode.user_id)
    end
  end

  describe "デコード" do
    it "デコードユーザーは一致していること" do
      decode = UserAuth::RefreshToken.new(token: @encode.token)
      # payload = decode.payload
      token_user = decode.entity_for_user
      expect(token_user).to eq(@user)
    end

    it "verify_claims は想定通りであること" do
      decode = UserAuth::RefreshToken.new(token: @encode.token)
      verify_claims = decode.send(:verify_claims)
      expect(verify_claims[:verify_expiration]).to be_truthy
      expect(verify_claims[:algorithm]).to eq(UserAuth.token_signature_algorithm)
    end

    it "有効期限後トークンはエラーを吐いていること" do
      travel_to(@lifetime.from_now + 1.second) do
        expect {
          UserAuth::RefreshToken.new(token: @encode.token)
        }.to raise_error(JWT::ExpiredSignature)
      end
    end

    it "トークンが書き換えられた場合エラーを吐いていること" do
      invalid_token = "#{@encode.token}a"
      expect {
        UserAuth::RefreshToken.new(token: invalid_token)
      }.to raise_error(JWT::VerificationError)
    end
  end

  describe "クレームの検証" do
    it "userのjtiが正常な場合" do
      @user.reload
      expect(@user.refresh_jti).to eq(@encode.payload[:jti])

      token = UserAuth::RefreshToken.new(token: @encode.token)
      expect(token).to be_truthy
    end

    it "userのjtiが不正な場合" do
      @user.remember("invalid")
      expect {
        UserAuth::RefreshToken.new(token: @encode.token)
      }.to raise_error(JWT::InvalidJtiError, "Invalid jti")
    end

    it "userにjtiが存在しない場合" do
      @user.reload
      @user.forget
      @user.reload
      expect(@user.refresh_jti).to be_nil
      expect {
        UserAuth::RefreshToken.new(token: @encode.token)
      }.to raise_error(JWT::InvalidJtiError, "Invalid jti")
    end
  end
end
