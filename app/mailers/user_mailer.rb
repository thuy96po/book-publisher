class UserMailer < ApplicationMailer
  include ApplicationHelper
  helper ApplicationHelper, BooksHelper
  def notifi_status bill
    @bill = bill
    @bill_info = @bill.info
    user_mail = User.load_email_from_bill @bill
    mail to: user_mail, subject: (t "mailer.notifi_status.subject",
      status: convert_status_bill(@bill.status))
  end
end
