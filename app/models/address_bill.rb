class AddressBill < ApplicationRecord
  belongs_to :user
  has_many :bills
end
