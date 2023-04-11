Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :clients, only: [:new, :create]
  resources :caregivers, only: [:new, :create, :index, :show]
end
