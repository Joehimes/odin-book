Rails.application.routes.draw do
  get 'friends/index'
  get 'friends/destroy'
  resources :friend_requests
  resources :profiles
  devise_for :users
  resources :posts
  get '/users/:id', to: 'users#show'
  get '/users', to: 'users#index'
  root to: 'users#show'
end
