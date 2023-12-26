require "rails_helper"

RSpec.describe Event do
  describe "モデルの関連付け" do
    it "Userモデルと正しく関連付けられていること" do
      association = Event.reflect_on_association(:user)
      expect(association.macro).to eq :belongs_to
    end

    it "Categoryモデルと正しく関連付けられていること" do
      association = Event.reflect_on_association(:categories)
      expect(association.macro).to eq :has_and_belongs_to_many
    end

    it "Commentモデルと正しく関連付けられていること" do
      association = Event.reflect_on_association(:comments)
      expect(association.macro).to eq :has_many
    end

    it "EventImageモデルと正しく関連付けられていること" do
      association = Event.reflect_on_association(:event_images)
      expect(association.macro).to eq :has_many
    end

    it "Favouriteモデルと正しく関連付けられていること" do
      association = Event.reflect_on_association(:favourites)
      expect(association.macro).to eq :has_many
    end

    it "Favouriteを通じてUserモデルと正しく関連付けられていること" do
      association = Event.reflect_on_association(:favourited_by_users)
      expect(association.macro).to eq :has_many
      expect(association.options[:through]).to eq :favourites
      expect(association.options[:source]).to eq :user
    end
  end
end
