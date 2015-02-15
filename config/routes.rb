Rails.application.routes.draw do
  
  root 'home#index'
  get "/about" => "home#about"
  patch "/toggle/:id" => "users#toggle", as: :toggle
  get "/my_drills" => "home#my_drills"
  get "/all_drills" => "home#all_drills"
  # TODO: Relationships to be added later

  resources :users, only: [:new, :create, :index, :update, :destroy] 
  resources :drill_groups 

  resources :tags
  resources :levels

  resources :sessions, only: [:new, :create] do
    delete :destroy, on: :collection
  end
  
  resources :drills, only: [] do
    resources :solutions, only: [ :new, :create, :edit, :update, :destroy ]
  end
  resources :drill_groups, only: [] do
    resources :drills
    resources :subscriptions
    resources :scorecards
    resources :tags, only: [] do
      resources :tagifications, only: [:create, :destroy]
    end
  end
end
