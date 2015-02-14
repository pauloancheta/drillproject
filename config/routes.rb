Rails.application.routes.draw do
  
  root 'home#index'

  # TODO: Relationships to be added later
  resources :solutions, only: [ :new, :create, :edit, :update, :destroy ]
  resources :drills

  resources :drill_groups 
  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create] do
    delete :destroy, on: :collection
  end
  resources :tags
  
  resources :drill_groups, only: [] do
    resources :tags, only: [] do
      resources :tagifications, only: [:create, :destroy]
    end
  end

  resources :levels
end
