class Admin::AdminController < ApplicationController
  layout "admin"
  before_action :load_user, :verify_admin

  def verify_admin
    return if current_user.role == User::ADMIN
    flash[:danger] = t "no_access_admin"
    redirect_to root_path
  end
end
