Rails.application.routes.draw do

  root 'user#show'
  devise_for :users

  resources :users

  resources :users, only: [:show] do
    resources :clients  
  end

  resources :users, only: [:show] do
    resources :schedules
  end

  resources :schedules
  resources :gym_list
  resources :clients



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
