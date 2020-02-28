class CreateCoffeeShops < ActiveRecord::Migration[6.0]
  def change
    create_table :coffee_shops do |t|
      t.string :name
      t.string :location
      t.string :image_url
      t.string :display_phone
      t.float :rating
      t.integer :review_count
      t.string :price

      t.timestamps
    end
  end
end
