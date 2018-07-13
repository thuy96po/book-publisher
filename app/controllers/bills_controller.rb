class BillsController < ApplicationController
  before_action :bills_params, only: :create
  before_action :load_user

  def new
    if current_cart.empty?
      flash[:danger] = t ".cart_empty"
      redirect_to root_path
    else
      load_books
      @address_bills = current_user.address_bills
      @bill = Bill.new
      @address_bill = @bill.build_address_bill
    end
  end

  def create
    @bill = Bill.create bills_params
    load_books
    insert_data
    session[:cart] = nil
    flash[:success] = t ".flash_success_content"
    redirect_to root_path
  end

  private
  def bills_params
    if params[:bill][:address_bill_id].nil?
      params.require(:bill).permit address_bill_attributes: [:user_id, :address,
                                                             :phone, :name]
    else
      params.require(:bill).permit :address_bill_id
    end
  end

  def insert_data
    ActiveRecord::Base.transaction do
      @bill.save
      @books_all.each do |book|
        quantity = current_cart[book.id.to_s]
        @bill_detail = BillDetail.create bill_id: @bill.id, book_id: book.id,
          price: final_price(book.price, book.discount), quantity: quantity
        @bill_detail.save
        book.update_attributes! quantity: book.quantity - quantity
      end
    end
    return unless @bill.persisted?
  end
end
