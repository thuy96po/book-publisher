class HomeController < ApplicationController
  before_action :search_params
  def index
    @books = Book.includes(:author).load_books_with_discount
                 .load_limit params[:last]
    if params[:search].nil?
      @author = Author.all
    else
      load_books_with_search
    end
    respond_to do |format|
      format.html
      format.js
    end
  end

  private
  def search_params
    @last = params[:last].present?
    return if params[:search].nil?
    search = params.require(:search).permit :name, :author, :max_price,
      :min_price
    @search = search.to_h
  end

  def load_books_with_search
    @books = @books.name_is @search[:name] unless @search[:name].blank?
    @books = @books.written_by @search[:author] unless @search[:author].blank?
    @books = @books.price_less_than @search[:max_price].to_i unless
      @search[:max_price].blank?
    @books = @books.price_greater_than @search[:min_price].to_i unless
      @search[:min_price].blank?
  end
end
