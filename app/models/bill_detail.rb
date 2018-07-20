class BillDetail < ApplicationRecord
  belongs_to :bill
  belongs_to :book

  delegate :name, to: :book, prefix: true

  def self.monthlyEarning
    bill_details = select("bill_details.quantity, bill_details.price AS
    real_price, books.price AS root_price").joins("JOIN books ON
    bill_details.book_id = books.id WHERE
    bill_details.created_at <= \"#{Time.now}\"
    AND bill_details.created_at >= \"#{Time.now-1.month}\"")

    total = 0
    total_with_discount = 0
    bill_details.each do |bill_detail|
      total += bill_detail.quantity * bill_detail.root_price
      total_with_discount += bill_detail.quantity * bill_detail.real_price
    end

    {total: total, total_with_discount: total_with_discount, discount: total - total_with_discount}
  end

  def self.send_monthly
    AdminMailer.monthly_earning.deliver_now
  end
end
