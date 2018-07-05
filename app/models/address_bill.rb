class AddressBill < ApplicationRecord
  belongs_to :user, inverse_of: :address_bills
  has_many :bills

  validates_presence_of :user
  VALID_PHONE_REGEX = /\A\d{10,11}\z/
  validates :name, presence: true, length: {maximum: Settings.max_name}
  validates :address, presence: true, length: {maximum: Settings.max_address}
  validates :phone, presence: true, format: {with: VALID_PHONE_REGEX}
end
