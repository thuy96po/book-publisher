class Book < ApplicationRecord
  belongs_to :author
  belongs_to :category
  has_many :book_discounts
  delegate :author_name, to: :author

  def self.list last
    select("books.*, book_discounts.discount")
      .joins("LEFT JOIN book_discounts ON books.id = book_discounts.book_id
    AND (book_discounts.start_date <= \"#{Time.now}\"
    AND book_discounts.end_date >= \"#{Time.now}\")")
      .limit(Settings.list_length).offset(last)
  end
end
