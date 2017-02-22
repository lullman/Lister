class RootController < ApplicationController

  def index
    p "*" * 25
    p "Root Controller :: Index"
    p "Logged In: #{logged_in?}"
    p "*" * 25
    
    if logged_in?
      redirect_to current_user
    end
  end

end