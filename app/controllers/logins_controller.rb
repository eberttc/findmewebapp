class LoginsController < ApplicationController
  def new
  end

  def create
    respond_to do |format|
       user=User.find_by(username: params[:user][:username])
        if user && user.authenticate( params[:user][:password])
          session[:user_id]=user.id
          flash[:success]="You are logged in"
           format.html { redirect_to root_path}
           format.json { render  json: user}
      
        else
          flash[:danger]   ="Your username or pasword does not macth"
           format.html { render :new }
           format.json { render json: '{"status":"Your username or pasword does not macth"}'  }
        end
    end
    
  end

  def destroy
    session[:user_id]=nil
    flash[:success]="You are logged out"
    redirect_to root_path
  end
end
