Rails.application.routes.draw do
  devise_for :users
  root to: 'boards#index'
  resources :users, only: [:show, :edit, :update]
  resources :boards
  resources :rooms, only: [:index, :show, :new, :create]
    
  end
end
