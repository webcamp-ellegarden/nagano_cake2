Rails.application.routes.draw do

  namespace :admins do
    get 'users/index'
    get 'users/show'
  end
  namespace :admins do
    get 'orders/index'
    get 'orders/show'
  end
  namespace :admins do
    get 'categories/index'
  end
  namespace :admins do
    get 'products/index'
    get 'products/show'
    get 'products/new'
    get 'products/edit'
  end
  namespace :admins do
    get 'homes/top'
  end
  devise_for :admins
  devise_for :users
  resources :users, only: [:show, :edit, :update]
  get 'users/:id/unregister' => 'users#unregister'
  get 'users/:id/leave' => 'users#leave'
  
  resources :delivery_addresses, only: [:index,:edit,:update,:destroy,:create]

  resources :products, only: [:index, :show]

  resources :orders, only: [:index, :show, :new, :update]
  get 'orders/:id/confirmation' => 'users#confirmation'
  get 'orders/:id/completation' => 'users#completation'
  
  resources :carts, only: [:index, :create, :update, :destroy]
  get 'carts/reset' => 'users#reset'



  namespace :admin do
    get 'users/index'
    get 'users/show'
  end
  namespace :admin do
    get 'orders/index'
    get 'orders/show'
  end
  namespace :admin do
    get 'categories/index'
  end
  namespace :admin do
    get 'products/index'
    get 'products/show'
    get 'products/new'
    get 'products/edit'
  end
  namespace :admin do
    get 'homes/top'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
