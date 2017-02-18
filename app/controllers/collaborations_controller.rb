class CollaborationsController < ApplicationController

  def show
    @user = User.find(params[:user_id])
    @collaboration = @user.collaborations.find_by(id: params[:id])
    @item = Item.new
  end
  
  def new
    # @user = User.find(params[:user_id])
  end

  def create
    p "*" * 25
    p "Collaborations Controller :: Create"
    p "Params"
    p params
    p "*" * 25
    list = List.find(params[:id])
    list.collaborators << current_user
    redirect_to user_collaboration_path(user_id: current_user, id: list)

  end

end