require 'byebug'
class User < ApplicationRecord
    include Rails.application.routes.url_helpers
    has_one_attached :profile_pic
    has_secure_password
    validates :name, uniqueness: {case_sensitive: false}
    has_many :favorites
    has_many :coffee_shops, through: :favorites

    
    # def propic
    #     byebug
    #     return unless self.profile_pic.attached?
    #     self.profile_pic.blob.attributes.slice('filename', 'byte_size').merge(url: profile_pic_url).tap{ |attrs| attrs['name'] = attrs.delete('filename') }
    # end

    # def profile_pic_url
    #     self.profile_pic.attach(profile_pic_blob)
    #     return self.profile_pic.service_url 
    # end
end
