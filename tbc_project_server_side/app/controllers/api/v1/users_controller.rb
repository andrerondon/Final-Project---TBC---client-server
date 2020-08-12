class Api::V1::UsersController < ApplicationController
    def new
        @user = User.new
      end
    
      def create
        @user = User.new params.require(:user).permit(:first_name, :last_name, :email, :password_digest, :password_confirmation, :address, :phone)
        if @user.save
          flash.delete(:warning)
          redirect_to root_path
        else
          flash[:warning] = "unable to create user"
          render :new
        end
      end

    
      def edit
        # @user User.find session[:user_id]
        @user = current_user # the current_user method already fetches the logged in user for us
      end

      private

      def user_params
        params.require(:user).permit(
            :first_name, :last_name, :email, :password_digest, :password_confirmation, :address, :phone
        )
      end
    
     
end
