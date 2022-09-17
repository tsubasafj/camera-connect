Rails.application.routes.draw do
  devise_for :users
  root to: 'boards#index'
  resources :users, only: [:show, :edit, :update]
end
