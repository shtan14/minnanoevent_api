FactoryBot.define do
  factory :event do
    association :user, factory: :demo_user
    title { "テストイベント" }
    description { "概要" }
    prefecture { "東京都" }
    city { "渋谷区" }
    location { "公園" }
    ticket_price { 1000 }
    favourites_count { 0 }
    phone_number { "090-1234-5678" }
    event_start_datetime { "2024-12-26T09:00:00.000+09:00" }
    event_end_datetime { "2024-12-26T014:00:00.000+09:00" }
  end
end
