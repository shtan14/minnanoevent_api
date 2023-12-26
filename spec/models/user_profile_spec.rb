require "rails_helper"

RSpec.describe UserProfile do
  describe "モデルの関連付け" do
    it "Userモデルに適正に関連づけられていること" do
      association = UserProfile.reflect_on_association(:user)
      expect(association.macro).to eq :belongs_to
    end
  end
  describe "バリデーション" do
    let(:user) { create(:demo_user) }
    it "bio, avatar, x_link, facebook_link, instagram_linkが空文字でも有効であること" do
      user_profile = build(:user_profile, user: user, bio: "", avatar: "", x_link: "", facebook_link: "", instagram_link: "")
      expect(user_profile).to be_valid
    end
  end
end
