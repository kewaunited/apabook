Rails.application.routes.draw do
  resources :apartments

  get 'login', to: 'sessions#new', as: :login
  post 'login', to: 'sessions#create', as: :session
  delete 'logout', to: 'sessions#destroy', as: :logout
  get 'register', to: 'accounts#new', as: :register
  post 'register', to: 'accounts#create', as: :accounts

  root 'apartments#index'
end
