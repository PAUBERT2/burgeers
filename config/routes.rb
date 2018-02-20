Rails.application.routes.draw do
  get 'burgers/index'

  get 'burgers/show'

  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # READ
  # Read All
  # get "tasks", to: "tasks#index"
  get "burgers", to: "burgers#index"

  # Read one burger
  # get "tasks/:id", to:"tasks#show", as: :task
  get "burgers/:id", to:"burgers#show", as: :burger

  # Or via resources
  # resources :burgers, only: [:index, :show]
  # WARNING : INDEX WHICH IS HOME
end
