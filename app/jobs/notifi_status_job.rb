class NotifiStatusJob < ApplicationJob
  queue_as :default

  def perform bill
    UserMailer.notifi_status(bill).deliver_later
  end
end
