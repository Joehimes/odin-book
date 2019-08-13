Rails.application.routes.draw do
  get 'friends/index'
  get 'friends/destroy'
  resources :friend_requests
  devise_for :users
  resources :posts
  get '/users/:id', to: 'users#show'
  root to: 'users#show'
end
