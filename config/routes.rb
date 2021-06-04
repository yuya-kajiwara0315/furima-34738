Rails.application.routes.draw do
  get 'informations/index'
  get 'informations/new'
  devise_for :users
  
  root to: "items#index"
  resources :items, only: [:index, :new, :create]
  resources :informations
end
