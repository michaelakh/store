Rails.application.routes.draw do
  #User Authentication
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  
  #User Info
  resources :cards do
    post 'dummy', to: 'cards#dummy'
  end
  resources :addresses, :except =>[:index, :show]
  
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
  get 'legal/promotions/details', to:'legals#promotions'
  
  resource :order, :except => [:new] do
    get 'cart', to: 'orders#cart'
    get 'address_select/handler', to: 'addresses#order'
    get 'address_select/addresses', to: 'addresses#order_address'
    post 'addresses', to:'addresses#create_order'
    get 'dispatch/handler', to: 'orders#dispatch_method'
    get 'pay/handler', to: 'orders#pay'
    post 'process/handler', to: 'orders#process_order'
    get 'confirm/handler', to: 'orders#confirm'
    post 'process/order', to: 'orders#confirm'
  end
  resources :products do
    get 'live', to: 'products#live'
  end
  
  #general Default route... may become depreciated in future releases
  get ':controller(/:action(/:id))'
  
  root 'skin_care#welcome'
end
