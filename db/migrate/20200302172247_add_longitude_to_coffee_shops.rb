class AddLongitudeToCoffeeShops < ActiveRecord::Migration[6.0]
  def change
    add_column :coffee_shops, :longitude, :decimal
  end
end
