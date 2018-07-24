FactoryBot.define do
  factory :book do
    name{Faker::Book.title}
    image{Faker::Avatar.image}
    price{Faker::Number.number 5}
    description{Faker::Lorem.sentence 100}
    quantity{Faker::Number.between(0, 80)}
    average_rate{Faker::Number.between(1, 5)}
    author_id 1
    category_id 1
  end
end
