class CoffeeShopsController < ApplicationController
  def index
    all_shops = CoffeeShop.all
    render json: all_shops.to_json(
      # :include => {:users =>
    {:except => [:created_at, :updated_at]}
    )
  end

  def create
  end
end
