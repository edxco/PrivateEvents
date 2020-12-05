class UsersController < ApplicationController
    before_action :set_user, only: [:show, :destroy]

    def new
        @user = User.new
    end

    def index
        @users = User.all
    end

    def show
        @created_events = current_user.events
        @user = User.find(params[:id])
        @event = Event.find(params[:id])
        @upcoming = @user.attended_events.upcoming
        @past = @user.attended_events.past
        @my_events = @user.events
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            flash[:notice] = "Welcome #{@user.username}, to private events"
            redirect_to user_path(current_user.id)
        else
            render 'new'
        end
    end

    def destroy
        @user.destroy
        redirect_to users_path
    end

    private

    def set_user
        @user = User.find(params[:id])
    end

    def user_params
        params.require(:user).permit(:username)
    end

end