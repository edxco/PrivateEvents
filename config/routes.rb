Rails.application.routes.draw do
  root 'events#index'
  resources :users, only: [:index, :new, :create, :show, :destroy]
  resources :events, only: [:index, :new, :create, :show, :destroy]
  get 'signup', to: 'users#new'
end
