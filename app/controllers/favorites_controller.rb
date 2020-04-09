class FavoritesController < ApplicationController

  def index
    render json: Favorite.all
  end

  def create
    favorite = Favorite.create(favorite_params)
    render json: favorite.to_json
  end

  def destroy
    favorite = Favorite.find_by(id: params[:id])
    favorite.destroy
  end

  def favorite_params
    params.require(:favorite).permit(:user_id, :coffee_shop_id)
  end
end
