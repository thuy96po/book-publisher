class Book < ApplicationRecord
  belongs_to :author
  belongs_to :category
  has_many :book_discounts
  has_many :comments
  delegate :name, :image, :description, to: :author, prefix: true
  scope :name_is, ->(name){where "name LIKE ?", "%#{name}%"}
  scope :written_by, ->(author_id){where author_id: author_id}
  scope :price_less_than, ->(price){where "price*(1-discount/100) <= ?", price}
  scope :price_greater_than,
    ->(price){where "price*(1-discount/100) >= ?", price}

  def self.load_books_with_discount
    select("books.*, book_discounts.discount")
      .joins("LEFT JOIN book_discounts ON books.id = book_discounts.book_id
    AND (book_discounts.start_date <= \"#{Time.now}\"
    AND book_discounts.end_date >= \"#{Time.now}\")")
      .order(created_at: :desc)
  end

  def self.load_limit last
    limit(Settings.list_length).offset(last)
  end
end
