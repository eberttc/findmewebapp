class UsersController < ApplicationController
   
   def new
      @user=User.new
   end
   
   def destroy
   end
   
   def create
      @user=User.new(user_params)
      respond_to do |format|
         if @user.save
           flash[:success]="Your account has been created succesfully"
           format.html { redirect_to root_path}
           format.json { render  json: @user}
           session[:user_id]=@user.id
         else
           format.html { render :new }
           format.json {  render json: @user.errors  }
    
         end
      end
   end
   
   def edit
       
   end
   
   def update
       
   end
       
   private 
      def user_params
       #params.require(:user).permit(:username, :email).merge(:password => :password).merge(:password_confirmation => :password_confirmation)
        params.require(:user).permit(:username, :email, :password , :password_confirmation)
      end
end
    
