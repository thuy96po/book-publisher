module BooksHelper
  def final_price price, discount
    return price if discount.nil?
    price - discount * price / 100
  end

  def load_price price
    number_to_currency price, precision: 0, delimiter: ","
  end

  def load_book book_id = params[:id]
    @book = if book_id.to_i != 0
              Book.find_by id: book_id
            else
              Book.find_by slug: book_id
            end
    return if @book.present?
    flash[:danger] = t "no_exit_book"
    redirect_to root_path
  end

  def load_books
    @books_all = Book.load_books_with_discount.where id: current_cart.keys
  end
end
