FactoryBot.define do
  factory :comment do
    association :user, factory: :demo_user
    association :event
    comment { "テストコメント" }
  end
end
