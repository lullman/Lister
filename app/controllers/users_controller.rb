class UsersController < ApplicationController

  # before_action :require_login
  skip_before_action :require_login, only: [ :new, :create ]
  
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    p "*" * 25
    p "Users Controller :: Create"
    p "Params..."
    p "#{params}"
    p "*" * 25

    user = User.new(user_params)
    if user.save
      log_in user
      redirect_to user_path(user)
    else
      flash[:error] = 'Sign Up Failed'
      render 'new'
    end

  end

  private

    def user_params
      params.require(:user).permit(:username, :password, :first_name, :last_name)
    end

end