Rails.application.routes.draw do

  root to: 'users#index'

  resources :users, only: [:index, :new, :create, :show, :edit, :update, :destroy]

  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  delete '/logout', to: "sessions#destroy"

  namespace :admin do
    resources :users, only: [:index, :edit, :show]
  end

end
