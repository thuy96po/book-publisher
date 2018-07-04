class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      flash[:success] = t ".flash_success_content"
      redirect_to root_path
    else
      flash.now[:danger] = t "sessions.new.flash_danger_content"
      render :new
    end
  end

  def destroy
    log_out if logged_in?
    flash[:success] = t ".flash_info_content"
    redirect_to root_path
  end
end
