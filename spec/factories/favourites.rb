FactoryBot.define do
  factory :favourite do
    association :user, factory: :demo_user
    association :event
  end
end
