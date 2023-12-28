require "rails_helper"

RSpec.describe Event do
  describe "モデルの関連付け" do
    it "Userモデルと適正に関連付けられていること" do
      association = Event.reflect_on_association(:user)
      expect(association.macro).to eq :belongs_to
    end

    it "Categoryモデルと適正に関連付けられていること" do
      association = Event.reflect_on_association(:categories)
      expect(association.macro).to eq :has_and_belongs_to_many
    end

    it "Commentモデルと適正に関連付けられていること" do
      association = Event.reflect_on_association(:comments)
      expect(association.macro).to eq :has_many
    end

    it "イベント削除時にコメントも全て削除されること" do
      user = create(:demo_user)
      event = create(:event, user:)  # ユーザーに関連付けられたイベントを作成

      # コメントを作成し、関連付けるイベントを指定
      create_list(:comment, 2, user:, event:)

      expect {
        event.destroy
      }.to change(Comment, :count).by(-2) # 関連するコメントが2つ削除されることを期待
    end

    it "EventImageモデルと適正に関連付けられていること" do
      association = Event.reflect_on_association(:event_images)
      expect(association.macro).to eq :has_many
    end

    it "イベント削除時にイベントイメージも全て削除されること" do
      user = create(:demo_user)
      event = create(:event, user:) # ユーザーに関連付けられたイベントを作成

      # イメージを作成し、関連付けるイベントを指定
      create_list(:event_image, 2, event:)

      expect {
        event.destroy
      }.to change(EventImage, :count).by(-2) # 関連するイメージが2つ削除されることを期待
    end

    it "Favouriteモデルと適正に関連付けられていること" do
      association = Event.reflect_on_association(:favourites)
      expect(association.macro).to eq :has_many
    end

    it "イベント削除時にお気に入りも全て削除されること" do
      user = create(:demo_user)
      event = create(:event, user:) # ユーザーに関連付けられたイベントを作成

      # お気に入りを作成し、関連付けるイベントとユーザーを指定
      create_list(:favourite, 2, user:, event:)

      expect {
        event.destroy
      }.to change(Favourite, :count).by(-2)  # 関連するお気に入りが2つ削除されることを期待
    end

    it "Favouriteを通じてUserモデルと適正に関連付けられていること" do
      association = Event.reflect_on_association(:favourited_by_users)
      expect(association.macro).to eq :has_many
      expect(association.options[:through]).to eq :favourites
      expect(association.options[:source]).to eq :user
    end
  end
end
