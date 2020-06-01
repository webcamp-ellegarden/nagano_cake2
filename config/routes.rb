Rails.application.routes.draw do

# devise-----------------------------------------------------
  # admins----------------------------------
  devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  }
  # users-----------------------------------
  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }
#------------------------------------------------------------
  root 'top#home'

# admins--------------------------------------------

  namespace :admins do
    resources :users, only: [:index,:show,:edit,:update,:destroy,:create]
  
    resources :orders, only: [:index,:show,:update,:destroy,:create]
  
    resources :categories, only: [:index,:edit,:update,:destroy,:create]

    resources :products, only: [:index,:edit,:new,:update,:destroy,:create,:show]

    get 'homes/top'
  end

  resources :users, only: [:show, :edit, :update]
  get 'users/:id/unregister' => 'users#unregister'
  get 'users/:id/leave' => 'users#leave'
  
  resources :delivery_addresses, only: [:index,:edit,:update,:destroy,:create]

  resources :products, only: [:index, :show,]

  resources :orders, only: [:index, :show, :new, :update]
  get 'orders/:id/confirmation' => 'users#confirmation'
  get 'orders/:id/completation' => 'users#completation'
  
  resources :carts, only: [:index, :create, :update, :destroy]
  get 'carts/reset' => 'users#reset'




  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
