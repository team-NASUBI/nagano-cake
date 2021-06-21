Rails.application.routes.draw do
  scope module: :public do
    resources :products, only: [:index, :show]
    get 'products/genre' => "products#search"
    resources :customers, only: [:update, :edit]
    get 'customers/my_page' => "customers#show"
    get 'customers/unsubscribe' => "customers#unsubscribe"
    get 'customers/withdraw' => "customers#withdraw"
    delete 'carts/destroy_all' => "carts#destroy_all"
    resources :carts, only: [:index, :create, :update, :destroy]
    post 'orders/confirm' => "orders#confirm"
    get 'orders/thanks' => "orders#thanks"
    resources :orders, only: [:index, :show, :new, :create]
    resources :shipping_addresses, except: [:show, :new]
    root to: 'homes#top'
    get 'homes/about'
  end

  namespace :admin do
    get '/' => 'orders#index'
    resources :orders, only: [:show, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :genres, only: [:index, :edit, :create, :update]
    resources :products, except: [:destroy]
    resources :order_products, only: [:update]
  end

 devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
}
  devise_for :customers, controllers: {
  sessions:      'customers/sessions',
  passwords:     'customers/passwords',
  registrations: 'customers/registrations'
}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
