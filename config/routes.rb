Rails.application.routes.draw do

  get 'about', to: 'pages#about', as: :about

  devise_for :users
  root to: 'burgers#index'

  resources :burgers, only: [:show, :new, :create, :destroy, :edit, :update] do
    resources :orders, only: [:new, :create]
  end

  resources :orders, only: [:show, :index] do
    collection do
      get "mine" , to: "orders#index_cooker_orders"
    end
  end

  namespace :admin do
    resources :burgers, only: [:index]
  end

end
# no destroy method on order, as we consider that a payed order cannot be canceled

