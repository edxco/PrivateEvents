class UsersController < ApplicationController
    before_action :set_user, only: [:show, :destroy]

    def new
        @user = User.new
    end

    def index
        @users = User.all
    end

    def create
        @user = User.new(user_params)
        if @user.save
            flash[:notice] = "Welcome #{user.username}, to private events"
            redirect_to users_path
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