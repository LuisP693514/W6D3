class UsersController < ApplicationController
    def index 
        # render plain: "I'm in the index action!"
        @users = User.all 
        render json: @users
    end

    def create
        @user = User.new(user_param)
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

        if @user.update(user_param)
            # redirect_to user_url(@user)
            render json: @user
        else
            render json: @user.errors.full_messages, status: :unprocessable_entity
        end
    end

    def destroy 
        @user = User.find(params[:id])
        @user.destroy
        @users = User.all
        render json: @users
    end
    
    private

    def user_param
        params.require(:users).permit(:username)
    end
end