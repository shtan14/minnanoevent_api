require "rails_helper"

RSpec.describe User do
  describe "名前のバリデーション" do
    let(:user) { User.new(email: "test@example.com", password: "password") }

    context "名前が入力されていない場合" do
      it "名前を入力してくださいと表示されること" do
        user.save
        expect(user.errors.full_messages).to include("名前を入力してください")
      end
    end

    context "名前が長すぎる場合" do
      let(:max) { 30 }
      let(:long_name) { "a" * (max + 1) }

      it "名前は30文字以内で入力してくださいと表示されること" do
        user.name = long_name
        user.save
        expect(user.errors.full_messages).to include("名前は30文字以内で入力してください")
      end
    end

    context "名前が最大許容長の場合" do
      let(:max) { 30 }
      let(:max_length_name) { "あ" * max }

      it "正常に保存されること" do
        user.name = max_length_name
        expect { user.save }.to change(User, :count).by(1)
      end
    end
  end

  describe "メールアドレスのバリデーション" do
    let(:user) { User.new(name: "test", password: "password") }

    context "メールアドレスが入力されていない場合" do
      it "メールアドレスを入力してくださいと表示されること" do
        user.save
        expect(user.errors.full_messages).to include("メールアドレスを入力してください")
      end
    end

    context "メールアドレスが長すぎる場合" do
      let(:max) { 255 }
      let(:domain) { "@example.com" }
      let(:email) { ("a" * (max + 1 - domain.length)) + domain }

      it "メールアドレスは255文字以内で入力してくださいと表示されること" do
        user.email = email
        user.save
        expect(user.errors.full_messages).to include("メールアドレスは#{max}文字以内で入力してください")
      end
    end

    context "正しいメールアドレスの書式" do
      let(:ok_emails) do
        %w[
          A@EX.COM
          a-_@e-x.c-o_m.j_p
          a.a@ex.com
          a@e.co.js
          1.1@ex.com
          a.a+a@ex.com
        ]
      end

      it "正常に保存されること" do
        ok_emails.each do |email|
          user.email = email
          expect(user.save).to be_truthy
        end
      end
    end

    context "不正なメールアドレスの書式" do
      let(:ng_emails) do
        %w[
          aaa
          a.ex.com
          メール@ex.com
          a~a@ex.com
          a@|.com
          a@ex.
          .a@ex.com
          a＠ex.com
          Ａ@ex.com
          a@?,com
          １@ex.com
          "a"@ex.com
          a@ex@co.jp
        ]
      end

      it "メールアドレスは不正な値ですと表示されること" do
        ng_emails.each do |email|
          user.email = email
          user.save
          expect(user.errors.full_messages).to include("メールアドレスは不正な値です")
        end
      end
    end
  end

  describe "メールアドレスの小文字化" do
    let(:email) { "USER@EXAMPLE.COM" }
    let(:user) { User.new(email:) }

    it "保存時にメールアドレスが小文字に変換されること" do
      user.save
      expect(user.email).to eq(email.downcase)
    end
  end

  describe "アクティブユーザーの一意性" do
    let(:email) { "test@example.com" }

    context "アクティブユーザーが存在しない場合" do
      it "同じメールアドレスで複数のユーザーが登録できること" do
        count = 3
        expect {
          count.times do |_n|
            User.create(name: "test", email:, password: "password")
          end
        }.to change(User, :count).by(count)
      end
    end

    context "ユーザーがアクティブになった場合" do
      before do
        User.create(name: "test", email:, password: "password")
      end

      let(:active_user) { User.find_by(email:) }

      it "同じメールアドレスでは新たなユーザーが作成できないこと" do
        active_user.update!(activated: true)
        expect(active_user.activated).to be_truthy

        user = User.new(name: "test", email:, password: "password")
        expect { user.save }.not_to change(User, :count)
        expect(user.errors.full_messages).to include("メールアドレスはすでに存在します")
      end
    end

    context "アクティブユーザーがいなくなった場合" do
      before do
        User.create(name: "test", email:, password: "password", activated: true)
      end

      it "ユーザーは正常に保存できること" do
        User.find_by(email:, activated: true).destroy!

        expect {
          User.create(name: "test", email:, password: "password", activated: true)
        }.to change(User, :count).by(1)
      end
    end

    context "一意性が保たれているか" do
      before do
        User.create(name: "test", email:, password: "password", activated: true)
      end

      it "アクティブな同じメールアドレスのユーザーが1人だけであること" do
        expect(User.where(email:, activated: true).count).to eq(1)
      end
    end
  end

  describe "パスワードのバリデーション" do
    let(:user) { User.new(name: "test", email: "test@example.com") }

    context "パスワードが入力されていない場合" do
      it "パスワードを入力してくださいと表示されること" do
        user.save
        expect(user.errors.full_messages).to include("パスワードを入力してください")
      end
    end

    context "最小文字数に関するバリデーション" do
      it "パスワードは8文字以上で入力してくださいと表示されること" do
        user.password = "a" * 7
        user.save
        expect(user.errors.full_messages).to include("パスワードは8文字以上で入力してください")
      end
    end

    context "最大文字数に関するバリデーション" do
      it "パスワードは72文字以内で入力してくださいと表示されること" do
        user.password = "a" * 73
        user.save
        expect(user.errors.full_messages).to include("パスワードは72文字以内で入力してください")
      end
    end

    context "書式のバリデーション" do
      let(:ok_passwords) do
        %w[
          pass---word
          ________
          12341234
          ____pass
          pass----
          PASSWORD
        ]
      end

      let(:ng_passwords) do
        %w[
          pass/word
          pass.word
          |~=?+"a"
          １２３４５６７８
          ＡＢＣＤＥＦＧＨ
          password@
        ]
      end

      it "正しい書式の場合、正常に保存されること" do
        ok_passwords.each do |pass|
          user.password = pass
          expect(user.save).to be_truthy
        end
      end

      it "間違った書式の場合、エラーが表示されること" do
        ng_passwords.each do |pass|
          user.password = pass
          user.save
          expect(user.errors.full_messages).to include("パスワードは半角英数字・ハイフン・アンダーバーが使えます")
        end
      end
    end
  end
end
