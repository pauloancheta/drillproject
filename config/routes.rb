Rails.application.routes.draw do
  resources :drills
  resources :tags
  resources :solutions, only: [ :new, :create, :edit, :update, :destroy ]
end
