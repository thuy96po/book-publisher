class Book < ApplicationRecord
  belongs_to :author
  belongs_to :category
  has_many :book_discounts
end
