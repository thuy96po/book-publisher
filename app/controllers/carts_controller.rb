class CartsController < ApplicationController
  def show
    return if current_cart.empty?
    load_books
    @pagy, @books = pagy @books_all
  end

  def destroy_all
    session[:cart] = nil if current_cart
    redirect_to carts_path
  end

  def destroy
    current_cart.delete(params[:id])
    load_books
    @book_id = params[:id]
  end

  def edit
    load_book
    change_cart params[:id], params[:quantity].to_i
    @book = Book.load_books_with_discount.find_by id: params[:id]
    load_books
  end
end
