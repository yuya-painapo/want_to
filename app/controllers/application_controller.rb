class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_filter :configure_permitted_parameters, if: :devise_controller?
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:nickname, :email, :password, :password_confirmation, :remember_me) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :nickname, :email, :password, :remember_me) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:nickname, :email, :password, :password_confirmation, :current_password) }
  end

  protect_from_forgery with: :exception

  rescue_from ActionController::RedirectBackError, with: :root

  def root
    redirect_to :root
  end

  def after_sign_in_path_for(_resource)
    home_index_path
  end

  # def after_sign_out_path_for(resource)
  #  admin_root_path
  # end

end
