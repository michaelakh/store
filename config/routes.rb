Rails.application.routes.draw do
  devise_for :users
  
  resource :subscription
  resources :products
  
  root 'products#index'
end
