class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # before_action :require_login
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  include SessionsHelper

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
  end


  private

  def require_login
    unless logged_in?
      flash[:warning] = 'You must be logged in to use this page'
      redirect_to login_path
      # redirect_to root_path
    end
  end

end
