Rails.application.routes.draw do
  root 'events#index'
  resources :events, only: [:index, :new, :create, :show, :destroy]
end
