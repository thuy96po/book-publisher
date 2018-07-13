class Bill < ApplicationRecord
  DEFAULT_STATUS = 1
  belongs_to :address_bill, inverse_of: :bills
  has_many :bill_details
  accepts_nested_attributes_for :address_bill
  validates_presence_of :address_bill

  before_save :default_status
  def default_status
    self.status ||= DEFAULT_STATUS
  end
end
