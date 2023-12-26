require "rails_helper"

RSpec.describe EventImage do
  describe "モデルの関連付け" do
    it "Eventモデルと正しく関連付けられていること" do
      association = EventImage.reflect_on_association(:event)
      expect(association.macro).to eq :belongs_to
    end
  end
end
