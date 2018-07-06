class HomeController < ApplicationController
  def index
    @books = Book.list params[:last]

    respond_to do |format|
      format.html
      format.js
    end
  end
end
