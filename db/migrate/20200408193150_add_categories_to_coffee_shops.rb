class AddCategoriesToCoffeeShops < ActiveRecord::Migration[6.0]
  def change
    add_column :coffee_shops, :categories, :text, array: true, default: []
  end
end
