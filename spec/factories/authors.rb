FactoryBot.define do
  factory :author do
    name{Faker::Book.author}
    image{Faker::Avatar.image}
    description{Faker::Lorem.sentence 100}
  end
end
