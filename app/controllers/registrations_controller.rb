class RegistrationsController < Devise::RegistrationsController
  before_action :custom_params
  respond_to :html, :js

  private
  def custom_params
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit :email, :password, :password_confirmation, :remember_me, :avatar
    end
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit :email, :password, :password_confirmation, :current_password,
        :avatar
    end
  end
end
