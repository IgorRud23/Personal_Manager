Rails.application.routes.draw do

  root 'users#show'
  devise_for :users, controllers: {omniauth_callbacks: 'callbacks'}

  resources :users

  resources :users, only: [:show] do
    resources :clients
  end

  resources :users, only: [:show] do
    resources :schedules
  end

  resources :schedules
  resources :gym_lists
  resources :clients



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
