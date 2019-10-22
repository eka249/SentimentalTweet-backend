Rails.application.routes.draw do
  resources :favorite_accounts
  resources :tweet_accounts
  resources :tweets
  resources :twitter_accounts
  resources :users
  post '/login', to: 'auth#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
