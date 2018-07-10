class Comment < ApplicationRecord
  belongs_to :book
  belongs_to :user
  delegate :email, to: :user, prefix: true

  validates :content, presence: true, length: {maximum: Settings.max_content}
  validates :rate, presence: true

  scope :order_created, ->{order created_at: :desc}
end
