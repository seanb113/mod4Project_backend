class ChangeColumnDefault < ActiveRecord::Migration[6.0]
  def up
    change_column :users, :profile_pic, :string, :default => nil
  end
end
