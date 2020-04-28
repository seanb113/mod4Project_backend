class User < ApplicationRecord
    # has_one_attached :profile_pic
    has_secure_password
    validates :name, uniqueness: {case_sensitive: false}
    has_many :favorites
    has_many :coffee_shops, through: :favorites
end
