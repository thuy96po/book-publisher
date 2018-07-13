class AddressBill < ApplicationRecord
  VALID_PHONE_REGEX = /\A\d{10,11}\z/
  belongs_to :user, inverse_of: :address_bills
  has_many :bills, inverse_of: :address_bill

  validates_presence_of :user
  validates :name, presence: true, length: {maximum: Settings.max_name}
  validates :address, presence: true, length: {maximum: Settings.max_address}
  validates :phone, presence: true, format: {with: VALID_PHONE_REGEX}
end
