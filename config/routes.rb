Rails.application.routes.draw do

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks',
                                    sessions: 'users/sessions'
   }
  root 'users#home'

  get '/events/finished', to: 'events#finished'

  resources :user_events
  resources :events
  resources :comments

  resources :users do
    resources :events
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
