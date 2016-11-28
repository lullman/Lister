class CollaborationsController < ApplicationController

  def show
    @user = User.find(params[:user_id])
    @collaboration = @user.collaborations.find_by(id: params[:id])
  end
  
  def new
  end

  def create
  end

end