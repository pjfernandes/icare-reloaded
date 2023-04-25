Rails.application.routes.draw do
  devise_for :users

  root to: "pages#home"

  resources :orders do
    collection do
      get :order_accept
    end
  end

  resources :clients, only: [:new, :create] do
    resources :orders
  end

  resources :caregivers, only: [:new, :create, :index, :show] do
    resources :orders
  end

  #get 'order_accept', to: 'orders#order_accept'
  #put 'order_accept', to: 'orders#order_accept'
end
