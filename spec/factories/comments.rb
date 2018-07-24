FactoryBot.define do
  factory :comment do
    content{Faker::Lorem.sentence 20}
    rate{Faker::Number.between(1, 5)}
    book_id 1
    user_id 1
  end
end
