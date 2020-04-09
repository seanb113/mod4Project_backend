class AddProfilePicToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :profile_pic, :string, default: "https://pixy.org/src/476/4764586.png"
  end
end
