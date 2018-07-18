class NotifiOrderJob < ApplicationJob
  queue_as :default

  def perform bill
    AdminMailer.notifi_order(bill).deliver_later
  end
end
