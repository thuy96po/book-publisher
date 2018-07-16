25.times do |n|
  name = Faker::Book.author
  image = Faker::Avatar.image
  description = Faker::Lorem.sentence 100
  Author.create!(name:  name, image: image, description: description)
end

5.times do |n|
  title = Faker::Lorem.sentence 5
  content = Faker::Lorem.sentence 5
  Category.create!(title: title, content: content)
end

10.times do |n|
  title = Faker::Lorem.sentence 5
  content = Faker::Lorem.sentence 5
  parent_id = Faker::Number.between(1, 5)
  Category.create!(title: title, content: content, parent_id: parent_id)
end

5.times do |n|
  title = Faker::Lorem.sentence 5
  content = Faker::Lorem.sentence 5
  parent_id = Faker::Number.between(11, 16)
  Category.create!(title: title, content: content, parent_id: parent_id)
end

80.times do |n|
  name = Faker::Book.title
  image = Faker::Avatar.image
  price = Faker::Number.number 5
  description = Faker::Lorem.sentence 100
  quantity = Faker::Number.between(0, 80)
  average_rate = Faker::Number.between(1, 5)
  author_id = Faker::Number.between(1, 25)
  category_id = Faker::Number.between(1, 20)
  created_at = Faker::Date.between(500.days.ago, Date.today)
  Book.create!(name: name, image: image, price: price, description: description,
    quantity: quantity, average_rate: average_rate, author_id: author_id,
    category_id: category_id, created_at: created_at)
end

30.times do |n|
  book_id = Faker::Number.between(1, 80)
  discount = Faker::Number.between(1, 100)
  start_date = Faker::Date.between(100.days.ago, Date.today)
  end_date = Faker::Date.forward(100)
  BookDiscount.create!(book_id: book_id, discount: discount,
    start_date: start_date, end_date: end_date)
end

20.times do |n|
  email = "user#{n+1}@gmail.com"
  password = "123456"
  avatar = Faker::Avatar.image
  User.create!(email: email, avatar: avatar, password: password,
    password_confirmation: password,)
end
User.create!(email: "admin@gmail.com", avatar: Faker::Avatar.image, role: 1,
  password: "123456", password_confirmation: "123456")

30.times do |n|
  address = Faker::Address.full_address
  phone = Faker::PhoneNumber.subscriber_number(10)
  name = Faker::Name.name
  user_id = Faker::Number.between(1, 20)
  AddressBill.create!(address: address, phone: phone, name: name,
    user_id: user_id)
end

100.times do |n|
  content = Faker::Lorem.sentence 20
  rate = Faker::Number.between(1, 5)
  book_id = Faker::Number.between(1, 80)
  user_id = Faker::Number.between(1, 20)
  Comment.create!(content: content, rate: rate, book_id: book_id,
    user_id: user_id)
end

5.times do |n|
  image = Faker::Avatar.image
  url = "https://www.chatwork.com"
  status = Faker::Boolean.boolean
  Advertisment.create!(image: image, url: url, status: status)
end
