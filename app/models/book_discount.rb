class BookDiscount < ApplicationRecord
  belongs_to :book
  delegate :name, to: :book, prefix: true

  validates :book_id, presence: true
  validates :discount, presence: true, numericality:
    {greater_than_or_equal_to: 0, less_than_or_equal_to: 100}
  validates :start_date, presence: true
  validates :end_date, presence: true
  validate :end_date_after_start_date

  scope :for_book, ->(book_id){where book_id: book_id}
  scope :discount_value, ->(discount){where discount: discount}
  scope :from_date, ->(from_date){where "start_date >= ?", from_date.to_s}
  scope :to_date, ->(to_date){where "end_date <= ?", to_date.to_s}

  def end_date_after_start_date
    return if end_date.blank? || start_date.blank? || end_date > start_date
    errors.add :end_date, "must be after start date"
  end
end
