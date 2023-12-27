require "rails_helper"

RSpec.describe Favourite do
  describe "モデルの関連付け" do
    it "Userモデルと適正に関連付けられていること" do
      association = Favourite.reflect_on_association(:user)
      expect(association.macro).to eq :belongs_to
    end

    it "Eventモデルと適正に関連付けられていること" do
      association = Favourite.reflect_on_association(:event)
      expect(association.macro).to eq :belongs_to
    end
  end

  describe "お気に入りの動作" do
    let(:user) { create(:demo_user) }
    let(:event) { create(:event) }

    it "お気に入り追加時にイベントのfavourites_countが1増えること" do
      expect {
        Favourite.create(user:, event:)
      }.to change { event.reload.favourites_count }.by(1)
    end

    it "お気に入り削除時にイベントのfavourites_countが1減ること" do
      favourite = Favourite.create(user:, event:)
      expect {
        favourite.destroy
      }.to change { event.reload.favourites_count }.by(-1)
    end
  end
end
