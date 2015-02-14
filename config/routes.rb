Rails.application.routes.draw do
  
  resources :solutions, only: [ :new, :create, :edit, :update, :destroy ]
  resources :drills
  resources :tags

end
