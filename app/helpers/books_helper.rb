module BooksHelper
  def final_price price, discount
    return price if discount.nil?
    price - discount * price / 100
  end

  def load_price price
    number_to_currency price, precision: 0, delimiter: ","
  end

  def load_book book_id = params[:id]
    @book = Book.find_by id: book_id
    return if @book.present?
    flash[:danger] = t "no_exit_book"
    redirect_to root_path
  end
end
