class SessionsController < ApplicationController

    def create
        user = User.find_by(username: params[:username])
    
        if user.present? && user.password == params[:password]
          session[:user_id] = user.id
          flash[:notice] = "Logged in!"
        #   redirect_to user_path(user)
        redirect_to user
        else
          flash[:notice] = "Username or password didn't match"
          redirect_to new_session_path
        end
      end
    
    def destroy
        session[:user_id] = nil
        redirect_to users_path
    end

    def new
    end
end
