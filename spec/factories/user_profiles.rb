FactoryBot.define do
  factory :user_profile do
    bio { "test_bio" }
    avatar { "test_avatar" }
    x_link { "test_x_link" }
    facebook_link { "test_facebook_link" }
    instagram_link { "test_instagram_link" }
  end
end
