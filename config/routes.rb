Rails.application.routes.draw do
  devise_for :users
  
  get 'legal/privacy_policy', to: 'legals#privacy'
  
  resource :subscription
  resources :products
  
  root 'products#index'
end
