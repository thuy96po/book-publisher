class Book < ApplicationRecord
  extend FriendlyId
  belongs_to :author
  belongs_to :category
  has_many :book_discounts
  has_many :comments
  delegate :name, :image, :description, to: :author, prefix: true

  validates :quantity, numericality: {greater_than_or_equal_to: 0}

  scope :name_is, ->(name){where "name LIKE ?", "%#{name}%"}
  scope :written_by, ->(author_id){where author_id: author_id}
  scope :price_less_than, ->(price){where "price*(1-discount/100) <= ?", price}
  scope :price_greater_than,
    ->(price){where "price*(1-discount/100) >= ?", price}

  friendly_id :name, use: [:slugged, :finders]

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

  def self.statistic start_date, end_date
    bill_seller = "SELECT bill_details.book_id, sum(bill_details.quantity) AS
      quantity FROM bill_details WHERE
      strftime(\"%Y-%m-%d\", bill_details.created_at) <= \"#{end_date}\" AND
      strftime(\"%Y-%m-%d\",bill_details.created_at) >= \"#{start_date}\"
      GROUP BY bill_details.book_id"

    select("books.name, selling.quantity")
      .joins("LEFT JOIN (#{bill_seller})AS selling ON books.id =
      selling.book_id").order("selling.quantity DESC")
  end

  def self.to_chart books
    charts = [[I18n.t("name"), I18n.t("carts.show.quantity")]]

    other = 0
    books.each_with_index do |book, index|
      quantity = book.quantity.to_i
      if index < Settings.chart_items
        charts << [book.name, quantity]
      else
        other += quantity
      end
    end

    charts << [I18n.t("admin.statistic.best_seller.other"), other]
  end
end
