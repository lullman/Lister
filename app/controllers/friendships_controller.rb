class FriendshipsController < ApplicationController

  def create
    @friendship = current_user.friendships.build(friend_id: params[:friend_id])
    if params[:friend_id] == "1"
      @friendship.accepted = true
    end

    if @friendship.save
      flash[:success] = "Friend Requested"
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
      redirect_to root_path, success: "Friend Confirmed"
    else
      redirect_to root_path, success: "Friend Confirmation Failed"
    end
  end

  def destroy
    @friendship = Friendship.find(params[:id])
    @friendship.destroy
    flash[:success] = "Friendship Removed"
    redirect_to :back
  end

end