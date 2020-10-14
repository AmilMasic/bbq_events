Rails.application.routes.draw do

  devise_for :users
  root 'sessions#home'

  resources :user_events
  resources :events
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
