require 'faker'

50.times do |n|
  name = Faker::JapaneseMedia::StudioGhibli.unique.character
  email = "demouser#{n}@example.com"
  user = User.find_or_initialize_by(email: email, activated: true)

  if user.new_record?
    user.name = name
    user.password = "password"
    user.save!
  end
end

puts "users = #{User.count}"
