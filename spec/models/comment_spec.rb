require "rails_helper"

RSpec.describe Comment do
  describe "モデルの関連付け" do
    it "Userモデルに適正に関連づけられていること" do
      association = Comment.reflect_on_association(:user)
      expect(association.macro).to eq :belongs_to
    end
    it "Eventモデルに適正に関連づけられていること" do
      association = Comment.reflect_on_association(:event)
      expect(association.macro).to eq :belongs_to
    end
  end
end
