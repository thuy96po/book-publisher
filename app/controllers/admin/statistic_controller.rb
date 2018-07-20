class Admin::StatisticController < Admin::AdminController
  def best_seller
    if params[:search].nil?
      @start_date = Time.now - 1.month
      @end_date = Time.now
    else
      @start_date = params[:search][:start_date]
      @end_date = params[:search][:end_date]
    end
    @books = Book.statistic @start_date, @end_date
    @books_chart = Book.to_chart @books
    @pagy, @books = pagy @books
  end
end
