class SessionsController < ApplicationController
    def new 
        @user = User.new
        render :new
    end

    def create
        @user = User.find_by_credentials(sessions_params[:username], sessions_params[:password])
        if @user
            login(@user)
            redirect_to cats_url
        else
            redirect_to new_session_url
        end
    end

    private

    def sessions_params
        params.require(:sessions).permit(:username, :password)
    end
end