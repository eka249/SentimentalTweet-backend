Rails.application.routes.draw do
  resources :favorite_celebs
  resources :tweet_accounts
  resources :tweets
  resources :users
  resources :celebs
  # resources :auth
  post '/login', to: 'auth#create'
  # ^^creating a valid token
  post '/del_favorites', to: 'favorite_celebs#logout_remove'
  get '/get_celebs', to: 'celebs#get_celeb'
  #^^ twitter fetch for celebs
  get '/current_user', to: 'auth#show'
  post '/users', to: 'users#create'
  post '/celebs', to: 'celebs#get_celeb'
  get '/profile', to: 'users#profile'
  patch 'users', to: 'users#update'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
