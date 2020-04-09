Rails.application.routes.draw do
 
 resources :coffee_shops, only: [:index]
 resources :users, only: [:index]
 resources :favorites
 post '/login', to: 'auth#create'
 post '/users/:id/coffeeshops', to: 'favorites#create'
 delete '/favorites/:id', to: 'favorites#destroy'
 get '/profile', to: 'users#profile'
 get '/users/:id/coffeeshops', to: 'coffee_shops#by_user'
 post '/users', to: 'users#create'


 

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
