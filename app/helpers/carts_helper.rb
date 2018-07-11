module CartsHelper
  def current_cart
    session[:cart] ||= Hash.new
  end

  def total_books
    @total = current_cart.values.inject(0, :+)
  end

  def subtotal_price price, discount, quantity
    load_price final_price(price, discount) * quantity
  end

  def total_price books
    total_price = 0
    books.each do |book|
      total_price += current_cart[book.id.to_s] *
                     final_price(book.price, book.discount)
    end
    total_price
  end

  def can_add book
    return "disabled" if book.quantity.zero? || (current_cart[book.id.to_s] &&
      book.quantity <= current_cart[book.id.to_s])
    ""
  end

  def change_cart book_id, quantity_after
    load_book book_id
    @enough = false
    return if quantity_after > @book.quantity
    @enough = true
    current_cart[book_id] = quantity_after
  end
end
