class AdminMailer < ApplicationMailer
  helper ApplicationHelper, BooksHelper
  default to: User.where(role: User::ADMIN).map(&:email)
  def notifi_order bill
    @bill = bill
    @bill_info = @bill.info
    mail subject: t("mailer.notifi_order.subject")
  end

  def monthly_earning
    @earn = BillDetail.monthlyEarning
    mail subject: t("mailer.monthly_earning.subject", time: Time.now.strftime("%m/%Y"))
  end
end
