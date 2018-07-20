require "BillDetail"
every 1.minute do
  runner "BillDetail.send_monthly", :environment => :development
end
