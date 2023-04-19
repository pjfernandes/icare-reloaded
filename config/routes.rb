Rails.application.routes.draw do
  devise_for :users

  root to: "pages#home"

  resources :orders

  resources :clients, only: [:new, :create] do
    resources :orders
  end

  resources :caregivers, only: [:new, :create, :index, :show] do
    resources :orders
  end

end
