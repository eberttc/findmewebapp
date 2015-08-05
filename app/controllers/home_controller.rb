class HomeController < ApplicationController
  def index
    
    redirect_to user_pets_path(current_user) if logged_in?
    
  end
end
