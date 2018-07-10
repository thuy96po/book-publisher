class CommentsController < ApplicationController
  before_action :load_user
  def create
    @comment = current_user.comments.build comments_params
    load_book params[:book_id]
    @comment.book_id = @book.id
    return if @comment.invalid?
    insert_data
    load_comments @book.id
  end

  private
  def comments_params
    params.require(:comment).permit :content, :rate
  end

  def insert_data
    ActiveRecord::Base.transaction do
      @comment.save
      @book.update_attribute :average_rate, cal_average_rate(@book.id)
    end

    return if @comment.persisted?
    flash[:danger] = t ".wrong"
    redirect_to book_path
  end
end
