Rails.application.routes.draw do
  root 'users#index'
  resources :users, only: [:index, :new, :create, :show, :destroy]
  resources :events, only: [:index, :new, :create, :show, :destroy]
  get 'signup', to: 'users#new'
  resources :session, only: [:new, :create, :destroy]
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  resources :attendee, only: [:new, :create, :destroy]
end
