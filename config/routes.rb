Rails.application.routes.draw do
  devise_for :users
  resources :posts
  get '/users/:id', to: 'users#show'
  root to: 'users#show'
end
