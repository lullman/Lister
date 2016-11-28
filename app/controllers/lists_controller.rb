class ListsController < ApplicationController

  # def index
  #   @user = User.find(params[:id])
  # end

  def show
    @list = List.find(params[:id])
  end
  
  def new
  end

  def create
  end

end