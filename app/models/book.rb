class Book < ApplicationRecord
  belongs_to :author
  belongs_to :category
  has_many :book_discounts
  has_many :comments
  delegate :name, :image, :description, to: :author, prefix: true

  def self.load_books_with_discount
    select("books.*, book_discounts.discount")
      .joins("LEFT JOIN book_discounts ON books.id = book_discounts.book_id
    AND (book_discounts.start_date <= \"#{Time.now}\"
    AND book_discounts.end_date >= \"#{Time.now}\")")
  end

  def self.load_limit last
    limit(Settings.list_length).offset(last)
  end
end
