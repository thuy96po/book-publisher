class BooksController < ApplicationController
  before_action :load_book
  def addition
    book_id = params[:id]
    current_cart[book_id] = 0 if current_cart[book_id].nil?
    current_cart[book_id] += 1
    total_books

    respond_to do |format|
      format.js
    end
  end

  def show
    @book = Book.load_books_with_discount.find_by id: params[:id]
    load_comments @book.id
    @comment = Comment.new
  end
end
