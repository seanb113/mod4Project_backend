class CoffeeShopsController < ApplicationController
  def index
    all_shops = CoffeeShop.all
    render json: all_shops.to_json(
      :include => {:users =>
    {:except => [:created_at, :updated_at]}}
    )
  end
  
  def by_user
    user = User.find(params[:id])
    user_shops = user.coffee_shops
    render json: user_shops.to_json(methods: :fav_number)
  end

  def create
  end

  def favorites
    favorite = Favorite.find_or_create_by(user_id: params[:user_id], coffeeshop_id: params[:coffeeshop_id])
    render json: favorite
  end

    def destroy
    favorite = Favorite.find_or_create_by(user_id: params[:user_id], coffeeshop_id: params[:coffeeshop_id])
    Favorite.destroy(favorite.id)
    end

end
