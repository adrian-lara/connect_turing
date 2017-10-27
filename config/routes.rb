Rails.application.routes.draw do

  root to: 'users#index'

  resources :users, only: [:index, :new, :create, :show]

  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  delete '/logout', to: "sessions#destroy"

  namespace :admin do
    resources :users, only: [:index, :edit, :update, :show, :destroy]
  end

  namespace :default do
    resources :users, only: [:edit, :update, :show, :destroy]
  end

end
