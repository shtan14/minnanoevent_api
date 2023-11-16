FactoryBot.define do
  factory :demo_user, class: User do
    name { "テストユーザー" }
    email { "test@example.com" }
    password { "password" } 
  end
end
