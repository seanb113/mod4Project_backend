class FavoritesController < ApplicationController
  def create
    favorite = Favorite.create(favorite_params)
    render json: favorite
  end

  def favorite_params
    params.require(:favorite).permit(:user_id, :coffeeshop_id)
  end
end
