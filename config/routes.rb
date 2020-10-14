Rails.application.routes.draw do

  devise_for :users
  root 'sessions#home'

  # get '/signup' => 'users#new'
  # post '/signup' => 'users#create'
  #
  # get '/login' => 'sessions#new'
  # post '/login' => 'sessions#create'

  # delete '/logout' => 'sessions#destroy'


  resources :user_events
  resources :events
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
