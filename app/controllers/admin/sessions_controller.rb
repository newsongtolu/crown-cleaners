module Admin
  class SessionsController < ApplicationController
    layout false # Doesn't use the admin dashboard layout for login

    def new
      # Renders login form
    end

    def create
      admin_user = AdminUser.find_by(email: params[:email])
      
      if admin_user && admin_user.authenticate(params[:password])
        session[:admin_user_id] = admin_user.id
        redirect_to admin_root_path, notice: "Logged in successfully to Crown Cleaners Portal."
      else
        flash.now[:alert] = "Invalid email or password."
        render :new, status: :unprocessable_entity
      end
    end

    def destroy
      session[:admin_user_id] = nil
      redirect_to admin_login_path, notice: "Logged out successfully."
    end
  end
end