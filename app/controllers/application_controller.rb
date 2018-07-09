class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include Pagy::Backend
  include SessionsHelper
  include BooksHelper
  include CartsHelper
  before_action :current_cart, :total_books
end
