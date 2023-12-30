require "rails_helper"

RSpec.describe "Api::V1::Events" do
  describe "GET /index" do
    it "適切な数のイベントが返されること" do
      create_list(:event, 12) # 12個のイベントを作成する
      get api_v1_events_path, params: { page: 2 }
      expect(response).to have_http_status(:ok)
      json_response = res_body # レスポンスJSONをハッシュで返す
      expect(json_response.size).to eq(4) # 2ページ目のイベントが4個返されることを期待
    end
  end

  describe "GET /show" do
    it "適切にイベント詳細が返されること" do
      event = create(:event)
      get api_v1_event_path(event), params: { id: event.id }
      expect(response).to have_http_status(:ok)
      json_response = res_body # レスポンスJSONをハッシュで返す
      expect(json_response["id"]).to eq(event.id)
    end
  end
end
