Rails.application.routes.draw do
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


end
