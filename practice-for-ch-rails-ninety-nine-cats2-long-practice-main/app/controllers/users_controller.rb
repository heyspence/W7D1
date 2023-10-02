class UsersController < ApplicationController
    def create
        user = User.new(user_params)
        if user.save
            redirect_to user_url(user)
        else
            redirect_to new_user_url
        end
    end

    def new
        render :new
    end

    private

    def user_params
        params.require(:user).permit(:username, :password_digest, :session_token)
    end
end
