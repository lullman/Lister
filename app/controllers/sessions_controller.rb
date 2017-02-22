class SessionsController < ApplicationController

  # include SessionsHelper
  skip_before_action :require_login, only: [:new, :create]
  
  def new
  end

  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.password == params[:session][:password]
      p "User Authenticated"
      log_in user
      redirect_to user_path(user)
    else
      flash[:danger] = 'Invalid Username/password'
      p "Authentication Failed"
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_path
  end

end