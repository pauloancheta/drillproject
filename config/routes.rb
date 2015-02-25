Rails.application.routes.draw do
  
  root 'home#index'
  get "/about" => "home#about"
  patch "/toggle/:id" => "users#toggle", as: :toggle
  get "/my_drills" => "home#my_drills"
  get "/all_drills" => "home#all_drills"
  post "/start_attempt" => "scorecards#start_attempt"
  patch "/attempt" => "scorecards#attempt"

  resources :users, except: [:show]
  resources :drill_groups 

  resources :tags, only: [:show]

  resources :sessions, only: [:new, :create] do
    delete :destroy, on: :collection
  end
  
  resources :drills, only: [] do
    resources :solutions, except: [:index, :show]
  end
  resources :drill_groups, only: [] do
    resources :drills, except: [:index, :show]
    resources :subscriptions, only: [:create, :destroy]
    resources :tags, only: [] do
      resources :tagifications, only: [:create, :destroy]
    end
  end
end
