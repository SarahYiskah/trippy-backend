Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # get '/snacks/', to: 'snacks#index'
  # get '/users/:user_id/snacks', to: 'users#users_snacks'
  namespace :api do
   namespace :v1 do
     post '/signup', to: 'users#create'
     get '/users/:user_id', to: 'users#show'
     get '/users/:user_id/followers', to: 'users#users_followers'
     get '/users/:user_id/following', to: 'users#users_following'
     post '/sessions', to: 'sessions#create'
   end
 end

end
