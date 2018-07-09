class CartsController < ApplicationController
  def show
    @books_all = Book.load_books_with_discount.where id: current_cart.keys
    @pagy, @books = pagy @books_all
  end
end
