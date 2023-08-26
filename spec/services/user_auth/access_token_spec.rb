require "rails_helper"

RSpec.describe UserAuth::AccessToken do
  include ActiveSupport::Testing::TimeHelpers
  before do
    @user = active_user
    @encode = UserAuth::AccessToken.new(user_id: @user.id)
    @lifetime = UserAuth.access_token_lifetime
  end

  describe "auth_token_methodsの確認" do
    it "初期設定値が想定通りであること" do
      expect(@encode.send(:algorithm)).to eq "HS256"
      expect(@encode.send(:secret_key)).to eq @encode.send(:decode_key)
      expect(@encode.send(:user_claim)).to eq :sub
      expect(@encode.send(:header_fields)).to eq({ typ: "JWT", alg: "HS256" })
    end

    it "user_idがnilの場合、暗号メソッドがnilを返すこと" do
      user_id = nil
      expect(@encode.send(:encrypt_for, user_id)).to be_nil
    end

    it "user_idがnilの場合、複合メソッドがnilを返すこと" do
      user_id = nil
      expect(@encode.send(:decrypt_for, user_id)).to be_nil
    end

    it "user_idが不正な場合、複合メソッドがnilを返すこと" do
      user_id = "aaaaaa"
      expect(@encode.send(:decrypt_for, user_id)).to be_nil
    end
  end

  describe "トークンのエンコード" do
    before do
      @expect_lifetime = @lifetime.from_now.to_i
    end

    it "トークンの有効期限が期待される時間と同じであること" do
      expect(@encode.send(:token_expiration)).to be_within(1.second).of(@expect_lifetime)
    end

    it "@payloadが想定通りであること" do
      payload = @encode.payload
      user_claim = @encode.send(:user_claim)
      expect(payload[:exp]).to eq @expect_lifetime
      expect(payload[user_claim]).to eq @encode.user_id
      expect(payload[:iss]).to eq UserAuth.token_issuer
      expect(payload[:aud]).to eq UserAuth.token_audience
    end

    it "lifetime_textメソッドの返り値が'30分'であること" do
      expect(@encode.lifetime_text).to eq "30分"
    end

    context "lifetimeキーが存在する場合" do
      before do
        time = 1
        lifetime = time.hour
        @payload = { lifetime: }
        @encode_with_lifetime = UserAuth::AccessToken.new(user_id: @user.id, payload: @payload)
      end

      it "claimsの値が変わっていること" do
        claims = @encode_with_lifetime.send(:claims)
        expect_lifetime = @payload[:lifetime].from_now.to_i
        expect(claims[:exp]).to eq expect_lifetime
      end

      it "lifetime_textが'1時間'を返すこと" do
        expect(@encode_with_lifetime.lifetime_text).to eq "1時間"
      end
    end
  end

  describe "トークンのデコード" do
    before do
      @decode = UserAuth::AccessToken.new(token: @encode.token)
      @payload = @decode.payload
    end

    it "デコードしたユーザーが一致していること" do
      token_user = @decode.entity_for_user
      expect(token_user).to eq @user
    end

    it "verify_claimsが想定通りであること" do
      verify_claims = @decode.send(:verify_claims)
      expect(verify_claims[:iss]).to eq UserAuth.token_issuer
      expect(verify_claims[:aud]).to eq UserAuth.token_audience
      expect(verify_claims[:algorithm]).to eq UserAuth.token_signature_algorithm
      expect(verify_claims[:verify_expiration]).to be_truthy
      expect(verify_claims[:verify_iss]).to be_truthy
      expect(verify_claims[:verify_aud]).to be_truthy
      expect(verify_claims[:sub]).to be_falsey
      expect(verify_claims[:verify_sub]).to be_falsey
    end

    it "有効期限内のトークンはエラーを発生させないこと" do
      travel_to(@lifetime.from_now - 1.second) do
        expect { UserAuth::AccessToken.new(token: @encode.token) }.not_to raise_error
      end
    end

    it "有効期限後のトークンはエラーを発生させること" do
      travel_to(@lifetime.from_now) do
        expect { UserAuth::AccessToken.new(token: @encode.token) }.to raise_error(JWT::ExpiredSignature)
      end
    end

    it "issuerが改ざんされたトークンはエラーを発生させること" do
      invalid_token = UserAuth::AccessToken.new(payload: { iss: "invalid" }).token
      expect { UserAuth::AccessToken.new(token: invalid_token) }.to raise_error(JWT::InvalidIssuerError)
    end

    it "audienceが改ざんされたトークンはエラーを発生させること" do
      invalid_token = UserAuth::AccessToken.new(payload: { aud: "invalid" }).token
      expect { UserAuth::AccessToken.new(token: invalid_token) }.to raise_error(JWT::InvalidAudError)
    end
  end

  describe "デコードオプションの検証" do
    context "subオプションに関する検証" do
      let(:sub) { @encode.user_id }
      let(:options) { { sub: } }
      let(:decode) { UserAuth::AccessToken.new(token: @encode.token, options:) }

      it "subオプションは有効であること" do
        verify_claims = decode.send(:verify_claims)

        expect(verify_claims[:sub]).to eq sub
        expect(verify_claims[:verify_sub]).to be_truthy
      end

      it "subオプションで有効なユーザーが返されること" do
        token_user = decode.entity_for_user

        expect(token_user).to eq @user
      end

      it "不正なsubオプションでエラーが発生すること" do
        options = { sub: "invalid" }

        expect {
          UserAuth::AccessToken.new(token: @encode.token, options:)
        }.to raise_error(JWT::InvalidSubError)
      end
    end
  end

  describe "not activeユーザーの挙動の検証" do
    before do
      @not_active = User.create(
        name: "a", email: "a@a.a", password: "password"
      )
    end

    it "アクティブでないユーザーも取得できること" do
      expect(@not_active.activated).to be_falsey
      encode_token = UserAuth::AccessToken.new(user_id: @not_active.id).token
      decode_token_user = UserAuth::AccessToken.new(token: encode_token).entity_for_user

      expect(decode_token_user).to eq @not_active
    end
  end
end
