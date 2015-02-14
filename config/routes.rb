Rails.application.routes.draw do
  
  resources :solutions, only: [ :new, :create, :edit, :update, :destroy ]
  resources :drills
  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create] do
    delete :destroy, on: :collection
  end
  
  resources :solutions, only: [ :new, :create, :edit, :update, :destroy ]
  resources :tags

end
