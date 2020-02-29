class UsersController < ApplicationController
    
    def index
    all_users = User.all
    render json: all_users.to_json(          
    {:except => [:created_at, :updated_at]})
    end
end
