class ApplicationController < ActionController::Base
    # def current_user
    #     @user = User.find_by()
    # end

    def login(user)
        session[:session_token] = user.reset_session_token!
    end
end