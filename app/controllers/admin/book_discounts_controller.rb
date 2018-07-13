class Admin::BookDiscountsController < Admin::AdminController
  before_action :load_discount, only: [:edit, :update, :show, :destroy]
  before_action :valid_time, only: [:edit, :destroy]
  before_action :book_discounts_params, only: [:create, :update]

  def index
    @book_discounts = BookDiscount.includes(:book).order(created_at: :desc)
    if params[:search].present?
      search_discounts
    end
    @pagy, @book_discounts = pagy @book_discounts
  end

  def new
    @book_discount = BookDiscount.new
  end

  def create
    @book_discount = BookDiscount.create book_discounts_params
    if @book_discount.save
      flash.now[:success] = t ".flash_success_content"
      redirect_to admin_book_discounts_path
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @book_discount.update_attributes book_discounts_params
      flash[:success] = t ".flash_success_content"
      redirect_to admin_book_discounts_path
    else
      render :edit
    end
  end

  def destroy
    if @book_discount.destroy
      flash[:success] = t ".flash_success_content"
    else
      flash[:danger] = t "wrong"
    end
    redirect_to admin_book_discounts_path
  end

  private
  def book_discounts_params
    params.require(:book_discount).permit :book_id, :discount, :start_date,
      :end_date
  end

  def load_discount
    @book_discount = BookDiscount.find_by id: params[:id]
    return unless @book_discount.nil?
    flash[:danger] = t "admin.book_discounts.no_discount"
    redirect_to admin_book_discounts_path
  end

  def valid_time
    return if @book_discount.start_date > Time.now ||
              @book_discount.end_date < Time.now
    flash[:danger] = t "admin.book_discounts.is_doing"
    redirect_to admin_book_discounts_path
  end

  def search_discounts
    search = params[:search]
    @book_discounts = @book_discounts.for_book(search[:book_id]) unless
        search[:book_id].blank?
    @book_discounts = @book_discounts.discount_value(search[:discount]) unless
        search[:discount].blank?
    @book_discounts = @book_discounts.from_date(search[:start_date]) unless
        search[:start_date].blank?
    @book_discounts = @book_discounts.to_date(search[:end_date]) unless
        search[:end_date].blank?
  end
end
