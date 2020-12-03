class SessionsController < ApplicationController
    def new

    end

    def create
        user = User.find_by(username: params[:session][:username].downcase)
        if user
            session[:user_id] = user.id
            flash[:notice] = "Welcome #{user.username}, to private events"
            redirect_to events_path
        else
            flash.now[:alert] = "Failed to login. User not register"
            render 'new'
        end
    end

    def destroy
        session[:user_id] = nil
        flash[:notice] = "Logged out"
        redirect_to root_path
    end

end