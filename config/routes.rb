Rails.application.routes.draw do
  post '/rate' => 'rater#create', :as => 'rate'
  # devise_for :customers, :controllers => {:registrations => "customers/registrations"}
  # devise_for :users, :controllers => {:registrations => "registrations"}
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root to: 'homes#index'

  devise_for :users, path: 'users', controllers: { sessions: "users/sessions",registrations: "users/registrations" }
  devise_for :customers, path: 'customers', controllers: { sessions: "customers/sessions",registrations: "customers/registrations" }

  resources :products do
  end

  resources :customers
  resources :reviews
  
  namespace :admin do
    resources :products
    resources :users
    resources :homes
    resources :orders
    resources :customers
    resources :order_items do
      collection do
        get :fetch_order_items
      end
    end
    resources :product_categories do
      collection do
        get :product
      end
    end
  end

  resources :cart_items do
    collection do
      get 'empty' => 'cart_items#empty_cart'
    end
  end
  resources :homes
  resources :addresses
  resources :orders do
    collection do
      get 'place' => 'orders#place_order'
      get 'details' => 'orders#order_detail'
      post 'create' => 'orders#create_order'
      get 'my' => 'orders#my_orders'
    end
  end
  resources :order_items do
    collection do
      get :fetch_order_items
    end
  end
  resources :wish_lists do
    collection do
      get :empty
      get :create_wish_list
    end
  end 
end
