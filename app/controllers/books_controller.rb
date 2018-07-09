class BooksController < ApplicationController
  def addition
    book_id = params[:id]
    current_cart[book_id] = 0 if current_cart[book_id].nil?
    current_cart[book_id] += 1
    @book = Book.find_by id: book_id
    total_books

    respond_to do |format|
      format.js
    end
  end
end
