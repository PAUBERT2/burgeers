Rails.application.routes.draw do
  devise_for :users
  root to: 'burgers#index'

  resources :burgers, only: [:index, :show, :new, :create] do
    resources :orders, only: [:new, :create]
  end

  resources :orders, only: [:show, :index]

  namespace :admin do
    resources :burgers, only: [:index, :destroy, :edit, :update]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
