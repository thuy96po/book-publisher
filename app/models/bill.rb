class Bill < ApplicationRecord
  belongs_to :address_bill
  has_many :bill_details
end
