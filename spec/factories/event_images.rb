FactoryBot.define do
  factory :event_image do
    association :event
    event_image { "test" }
  end
end
