Rails.application.routes.draw do

  root 'sessions#home'

  get '/singup' => 'users#new'
  post '/signup' => 'users#create'

  resources :user_events
  resources :events
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
