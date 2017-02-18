class ItemsController < ApplicationController

  def new
  end

  def create
    p "*" * 25
    p "Items Controller :: Create"
    p "Params #{params}"
    p "*" * 25
    list_source = params[:item][:source]
    list = List.find(params[:list_id])
    item = Item.new(item_params)
    if list_source == "collaboration"
      item.suggested_by = current_user.id
    end
    list.items << item
    if item.save
      p "Item Saved"
      if list_source == "list"
        redirect_to user_list_path(user_id: list.user_id, id: list.id)
      else
        redirect_to user_collaboration_path(user_id: current_user, id: list.id)
      end
    else
      p "Save Failed"
    end
  end


private

  def item_params
    params.require(:item).permit(:item_name, :url, :list_id)
  end


end
