module SessionsHelper
  def log_in user
    session[:user_id] = user.id
  end

  def logged_in?
    current_user.present?
  end

  def log_out
    session.delete :user_id
    @current_user = nil
  end

  def load_user
    return if user_signed_in?
    flash[:danger] = t "user_must_sign_in"
    redirect_to new_user_session_path
  end
end
