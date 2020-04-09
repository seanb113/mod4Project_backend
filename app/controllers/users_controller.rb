class UsersController < ApplicationController
    def index
        all_users = User.all
        render json: all_users.to_json(
          :include => {:coffee_shops =>
        {:except => [:created_at, :updated_at]}}
        )
    end
    
    def show
        user = User.find(params[:id])
        render json: user.to_json(
          :include => {:favorites =>
            {:except => [:created_at, :updated_at]}}
        )
    end

    def create
      byebug
      user = User.create(user_params)
      if user.save
        render json: {
            status: :created,
            data: user
          }
      else 
          render json: {
            status: 500,
            errors: @user.errors.full_messages
          }
      end
    end

    def profile
        token= request.headers["Authentication"]
        user = User.find(decode(token)["id"])
        render json: user
    end

    def favorites
        favorite = Favorite.find_or_create_by(user_id: params[:user_id], coffeeshop_id: params[:coffeeshop_id])
        render json: favorite
    end
    
    def destroy
        favorite = Favorite.find_or_create_by(user_id: params[:user_id], coffeeshop_id: params[:coffeeshop_id])
        Favorite.destroy(favorite.id)
    end

    def update
      user = User.find(params[:id])
      user.update_attributes(user_params)
      render json: user
    end

    private

    def user_params
        params.require(:user).permit(:name, :password, :profile_pic)
    end
    
end
