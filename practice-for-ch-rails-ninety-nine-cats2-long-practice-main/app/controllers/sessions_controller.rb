class SessionsController < ApplicationController
    def new
        render :new
    end

    def create
        if User.find_by_credentials(sessions_params)
            session_token = reset_session_token!
            session[:session_token] = session_token
            redirect_to cats_url
        else
            redirect_to session_url
        end
    end

    private

    def sessions_params
        params.require(:session).permit(:username, :password)
    end
end