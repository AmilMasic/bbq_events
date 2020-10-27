Rails.application.routes.draw do

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks',
                                    sessions: 'users/sessions'
   }
  root 'sessions#home'

  resources :user_events
  resources :events
  resources :users do
    resources :events
    resources :user_events
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
