class AddColumnToCoffeeShop < ActiveRecord::Migration[6.0]
  def change
    add_column :coffee_shops, :distance, :float
  end
end
