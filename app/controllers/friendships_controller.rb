class FriendshipsController < ApplicationController

  def create
    @friendship = current_user.friendships.build(friend_id: params[:friend_id])
    if @friendship.save
      flash[:notice] = "Friend Requested"
      redirect_to :back
    else
      flash[:alert] = "Request Failed"
      redirect_to :back
    end
  end

  def update
    @friendship = Friendship.find(params[:id])
    @friendship.update(accepted: true)
    if @friendship.save
      redirect_to root_path, notice: "Friend Confirmed"
    else
      redirect_to root_path, notice: "Friend Confirmation Failed"
    end
  end

  def destroy
    @friendship = Friendship.find(params[:id])
    @friendship.destroy
    flash[:notice] = "Friendship Removed"
    redirect_to :back
  end

end