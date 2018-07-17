class UsersController < ApplicationController
  before_action :user_params, only: :create
  before_action :load_user, only: :show

  def show; end

  def new
    @user = User.new
    @user.address_bills.build
  end

  def create
    @user = User.new user_params
    if @user.save
      log_in @user
      flash[:success] = t ".flash_success_content"
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit :email, :avatar,
      :password, :password_confirmation, address_bills_attributes:
      [:id, :address, :phone, :name, "_destroy"]
  end
end
