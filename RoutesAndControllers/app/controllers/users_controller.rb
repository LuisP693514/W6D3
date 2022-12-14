class UsersController < ApplicationController
    def index 
        # render plain: "I'm in the index action!"
        @users = User.all 
        render json: @users
    end

    def create
        @user = User.new(userparam)
        # user.save!
        # render json: user

        if @user.save
            render json: @user
        else
            render json: @user.errors.full_messages, status: :unprocessable_entity
        end
    end

    def show
        @user = User.find(params[:id])

        render json: @user
    end

    def update 
        @user = User.find(params[:id])

        if @user.update(userparam)
            redirect_to user_url(@user)
        else
            render json: @user.errors.full_messages, status: :unprocessable_entity
        end
    end

    def destroy 
        @user = User.find(params[:id])
        @user.destroy
        redirect_to user_url
    end
    
    private

    def userparam
        params.require(:users).permit(:username)
    end
end