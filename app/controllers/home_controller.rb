class HomeController < ApplicationController
  def index
    @books = Book.load_books_with_discount.load_limit params[:last]

    respond_to do |format|
      format.html
      format.js
    end
  end
end
