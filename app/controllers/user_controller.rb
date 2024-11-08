class UserController < ApplicationController

    #user clicks login button
    def handle_login
        user = User.find_or_create_by(username: params[:username])
        session[:user_id] = user.id
        redirect_to root_path
    end

    #user logs out
    def handle_logout
        session.delete(:user_id)
        redirect_to login_path
    end
end
