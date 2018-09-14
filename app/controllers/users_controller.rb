class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def show
        @user = User.find(params[:id])
    end

    #GET /users/:id/edit
    def edit
        @user = User.find(params[:id])
    end

    #PUT /users/:id
    def update
        @user = User.find(params[:id])
        @user.update(params[:user])
        flash[:notice] = "User Updated."
        redirect_to @user
    end

    def create
        @user = User.create(params[:user])
        flash[:notice] = "User Created"
        redirect_to users_path
    end

    def index
        @users = User.all
    end

    def destroy
        User.find(params[:id]).destroy
        flash[:notice] = "Destroyed user."
        redirect_to users_path
    end
end
