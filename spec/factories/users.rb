FactoryBot.define do
  factory :user do
    name { Faker::Name.last_name }
    email { Faker::Internet.free_email }
    password { Faker::Lorem.characters(number: 6, min_alpha: 1, min_numeric: 1) }
    password_confirmation { password }
    camera { Faker::Lorem.characters(number: 10) }
    camera_career { Faker::Lorem.characters(number: 10) }
    model_career { Faker::Lorem.characters(number: 10) }

    after(:build) do |user|
      user.avatar.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end