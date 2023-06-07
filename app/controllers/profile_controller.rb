class ProfileController < ApplicationController
    def show
      # Logic to fetch and display the user's profile
      @user= User.all
    end
  
    def edit
      # Logic to display the profile edit form
    end
  
    def update
      # Logic to update the user's profile
    end
  end
  