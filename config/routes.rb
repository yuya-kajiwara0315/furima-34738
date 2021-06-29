Rails.application.routes.draw do
  get 'informations/index'
  get 'informations/new'
  devise_for :users
  
  root to: "items#index"
  resources :items do
    resources :orders, only: [:index, :create] 
  end
end
