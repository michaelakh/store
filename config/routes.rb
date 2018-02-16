Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  
  # Contact Pages
  get 'contact', to: 'contacts#contact'
  
  # Skin Care Pages
  get 'skin_care', to: 'skin_care#welcome'
  get 'skin_care/how_it_works', to: 'skin_care#how_it_works'
  get 'skin_care/eczema', to: 'skin_care#eczema'
  get 'skin_care/itchy_skin', to: 'skin_care#itchy_skin'
  get 'skin_care/dry_skin', to: 'skin_care#dry_skin'
  get 'skin_care/bruises', to: 'skin_care#bruises'
  get 'skin_care/cradle_cap', to: 'skin_care#cradle_cap'
  
  # About Pages
  get 'about', to: 'about#about'
  get 'about/nucifera', to: 'about#nucifera'
  
  # Legal Pages
  get 'legal/privacy_policy', to: 'legals#privacy'
  get 'legal/terms', to: 'legals#terms'
  
  resource :subscription
  resources :products
  
  root 'skin_care#welcome'
end
