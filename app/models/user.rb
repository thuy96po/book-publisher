class User < ApplicationRecord
  has_many :address_bills
  has_many :comments
end
