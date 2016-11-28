class ListsController < ApplicationController

  def show
    @list = List.find(params[:id])
  end
  
  def new
  end

  def create
  end

end