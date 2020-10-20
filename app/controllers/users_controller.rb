class UsersController < ApplicationController
    before_action :find_user, only: [:show, :edit, :update, :destroy]
    
    def index
        @users = User.all
    end

    def new
        @user = User.new
    end

    def create 
        user = User.create(user_params)
    
        if user.valid? 
          session[:user_id] = user.id
          
          redirect_to movies_path
        else
          flash[:errors] = user.errors.full_messages
          redirect_to new_user_path 
        end 
      end 

    def show
        
    end

    # def edit
        
    # end


    # def update
    #     if @user.update
    #         redirect_to user_path(@user)
    #     else
    #         render action: "edit"
    #     end
    # end

   private

   def user_params
    params.require(:user).permit(:username, :name, :password)
   end


   def find_user
    @user = User.find(params[:id])
   end
end
