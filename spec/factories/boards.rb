FactoryBot.define do
  factory :board do
    title { Faker::Lorem.word }
    content { Faker::Lorem.sentence }
    want_id { 2 }
    prefecture_id { 2 }
    association :user
  end
end
