class UserController < ApplicationController
    def index
        # Logic to fetch and display the user's profile

        if user_signed_in?
          @user= current_user
        else
          redirect_to :user_session
        end

        @users= User.all
      end
    
      def edit
        # Logic to display the profile edit form
      end
    
      def update
        # Logic to update the user's profile
      end
  
      def new
        @user = User.new
      end
    
      def create
        @user = User.new(user_params)
        if @user.save
          redirect_to '/profile', notice: "User was successfully created."
        else
          render :new
        end
      end
    
      private
    
      def user_params
        params.require(:user).permit(:name, :email)
      end
end
