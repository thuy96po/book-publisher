FactoryBot.define do
  factory :category do
    title{Faker::Lorem.sentence 5}
    content{Faker::Lorem.sentence 5}
  end
end
