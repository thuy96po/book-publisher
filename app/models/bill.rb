class Bill < ApplicationRecord
  UNCHECK = Settings.status_uncheck
  INPROGRESS = Settings.status_inprogress
  DONE = Settings.status_done
  belongs_to :address_bill, inverse_of: :bills
  has_many :bill_details, dependent: :destroy
  accepts_nested_attributes_for :address_bill
  delegate :name, :address, :phone, to: :address_bill
  validates_presence_of :address_bill

  before_save :default_status
  def default_status
    self.status ||= UNCHECK
  end

  def info
    bill_details = BillDetail.includes(:book).where bill_id: self
    total = 0
    bill_details.each do |bill_detail|
      total += bill_detail.quantity * bill_detail.price
    end
    {bill_details: bill_details, total: total}
  end
end
