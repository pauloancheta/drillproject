Rails.application.routes.draw do
  
  root 'home#index'

  resources :solutions, only: [ :new, :create, :edit, :update, :destroy ]
  resources :drills
  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create] do
    delete :destroy, on: :collection
  end
  
  resources :drills
  resources :tags
end
