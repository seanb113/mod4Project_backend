class CreatePlaces < ActiveRecord::Migration[6.0]
  def change
    create_table :places do |t|
      t.decimal :latitude
      t.decimal :longitude

      t.timestamps
    end
  end
end
