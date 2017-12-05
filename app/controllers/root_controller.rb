class RootController < ApplicationController

  # before_action :authenticate_user!
  skip_before_action :authenticate_user!, only: [ :index ]
  
  def index
    p "*" * 25
    p "Root Controller :: Index"
    p "User: #{current_user}"
    p "Logged In: #{user_signed_in?}"
    p "*" * 25
    
    if user_signed_in?
      redirect_to current_user
    end
  end

end