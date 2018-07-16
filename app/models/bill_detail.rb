class BillDetail < ApplicationRecord
  belongs_to :bill
  belongs_to :book

  delegate :name, to: :book, prefix: true
end
