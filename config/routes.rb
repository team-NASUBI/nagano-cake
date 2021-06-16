Rails.application.routes.draw do
  namespace :public do
    resources :products, only: [:index, :show] 
    get 'products/genre' => "products#search"
    resources :customers, only: [:update, :edit] 
    get 'customers/my_page' => "customers#show"
    get 'customers/unsubscribe' => "customers#unsubscribe"
    patch 'customers/withdraw' => "customers#withdraw"
    resources :carts, only: [:index, :create, :update, :destroy] 
    delete 'carts/destroy_all' => "carts#destroy_all"
    resources :orders, only: [:index, :show, :new, :create] 
    get 'orders/confirm' => "orders#confirm"
    get 'orders/thanks' => "orders#thanks"
    resources :shipping_addresses, except: [:show, :new] 
    get 'homes/top'
    get 'homes/about'
  end
  
  namespace :admin do
    resources :orders, only: [:index, :show] 
    resources :customers, only: [:index, :show, :edit] 
    resources :genres, only: [:index, :edit] 
    resources :products, only: [:index,:new, :show, :edit] 
  end
  
  devise_for :admins
  devise_for :customers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
