module BooksHelper
  def final_price price, discount
    return price if discount.nil?
    price - discount * price / 100
  end

  def load_price price
    number_to_currency price, precision: 0, delimiter: "."
  end
end
