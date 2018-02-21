Rails.application.routes.draw do

  devise_for :users
  root to: 'burgers#index'

  resources :burgers, only: [:show, :new, :create, :destroy, :edit, :update] do
    resources :orders, only: [:new, :create]
  end

  resources :orders, only: [:show, :index]

  namespace :admin do
    resources :burgers, only: [:index]
  end

end
# no destroy method on order, as we consider that a payed order cannot be canceled

