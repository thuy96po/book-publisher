class Admin::BillsController < Admin::AdminController
  before_action :load_bill, except: :index
  before_action :valid_for_destroy, only: :destroy
  before_action :valid_for_edit, only: :edit
  def index
    @pagy, @bills = pagy Bill.includes(:address_bill).order(created_at: :desc)
  end

  def show
    @pagy, @bill_details = pagy BillDetail.includes(:book)
                                          .where bill_id: params[:id]
    respond_to do |format|
      format.html
      format.xls
    end
  end

  def edit
    @status = [[t("admin.bills.inprocess"), Bill::INPROGRESS],
      [t("admin.bills.done"), Bill::DONE]]
    return if @bill.status != Bill::UNCHECK
    @status << [t("admin.bills.uncheck"), Bill::UNCHECK]
  end

  def update
    if @bill.update_attributes bill_params
      flash[:success] = t ".flash_success_content"
      NotifiStatusJob.set(wait: Settings.delay_mail.second).perform_later @bill
    else
      flash[:danger] = t "wrong"
    end
    redirect_to admin_bills_path
  end

  def destroy
    if @bill.destroy
      flash[:success] = t ".flash_success_content"
    else
      flash[:danger] = t "wrong"
    end
    redirect_to admin_bills_path
  end

  private
  def bill_params
    params.require(:bill).permit :status
  end

  def load_bill
    @bill = Bill.find_by id: params[:id]
    return if @bill.present?
    flash[:danger] = t "admin.bills.no_bill"
    redirect_to admin_bills_path
  end

  def valid_for_destroy
    return if @bill.status == Bill::DONE
    flash[:danger] = t ".flash_danger_content"
    redirect_to admin_bills_path
  end

  def valid_for_edit
    return if @bill.status != Bill::DONE
    flash[:danger] = t ".flash_danger_content"
    redirect_to admin_bills_path
  end
end
