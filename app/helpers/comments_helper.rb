module CommentsHelper
  def load_comments book_id
    @pagy, @comments = pagy Comment.order_created.includes(:user)
                                   .where book_id: book_id
  end

  def cal_average_rate book_id
    @average_rate = Comment.where(book_id: book_id).average(:rate).round(1)
  end
end
