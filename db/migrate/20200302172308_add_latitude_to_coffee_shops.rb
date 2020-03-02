class AddLatitudeToCoffeeShops < ActiveRecord::Migration[6.0]
  def change
    add_column :coffee_shops, :latitude, :decimal
  end
end
