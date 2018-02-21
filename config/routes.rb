Rails.application.routes.draw do

  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :burgers, only: [:index, :show, :new, :create] do
    resources :orders, only: [:new, :create]
  end
  resources :orders, only: [:index, :show]

  namespace :admin do
    resources :burgers, only: [:index, :edit, :update, :destroy]
  end

end
# no destroy method on order, as we consider that a payed order cannot be canceled

