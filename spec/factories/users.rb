FactoryBot.define do
  factory :demo_user, class: "User" do
    name { "テストユーザー" }
    email { Faker::Internet.unique.email }
    password { "password" }
    activated { true }

    after(:create) do |user|
      create(:user_profile, user:)
    end
  end
end
