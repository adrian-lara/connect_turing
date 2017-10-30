Rails.application.routes.draw do

  root to: 'users#index'

  resources :users, only: [:index, :new, :create, :show]

  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  delete '/logout', to: "sessions#destroy"

  put '/accept', to: "mentor_mentees/base#accept", as: 'accept'
  put '/reject', to: "mentor_mentees/base#reject", as: 'reject'

  put '/request', to: 'mentor_mentees/base#request_mentorship', as: 'request'

  namespace :admin do
    resources :users, only: [:index, :edit, :update, :show, :destroy]
  end

  namespace :default do
    resources :users, only: [:edit, :update, :show, :destroy]
  end

end
