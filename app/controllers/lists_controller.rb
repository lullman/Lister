class ListsController < ApplicationController

  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
    @item = Item.new(list_id: @list.id)
    if @list.user != current_user
      redirect_to user_path current_user
    end
  end
  
  def new
    @list = List.new(user_id: params[:user_id])
  end

  def edit
    @list = List.find(params[:id])
  end

  def create
    list = List.new(list_params)
    if list.save
      redirect_to list
    else
      redirect_to new_user_list_path(user_id: current_user)
    end
  end

  def update
    p "*" * 25
    p "Lists Controller :: Update"
    p "Params..."
    p params
    p "*" * 25
    list = List.find(params[:id])
    if params[:source] == "collaboration"
      p "Adding Collaborator"
      list.collaborators << current_user
      redirect_to user_collaboration_path(user_id: current_user, id: list.id)
    else
      list.update(list_params)
      redirect_to list
    end
  end

  private

    def list_params
      params.require(:list).permit(:user_id, :list_name, :list_type, :public)
    end


end