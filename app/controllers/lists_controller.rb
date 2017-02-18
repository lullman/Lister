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
  end

  def create
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
    end
  end

end