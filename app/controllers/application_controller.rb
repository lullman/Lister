class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :require_login
  
  include SessionsHelper

  private

  def require_login
    unless logged_in?
      flash[:error] = 'You must be logged in to use this page'
      redirect_to login_path
      # redirect_to root_path
    end
  end

end
