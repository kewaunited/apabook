Rails.application.routes.draw do
  resources :apartments

  resources :apartments, only: [:index]

  scope '/user' do
    resources :apartments, only: [:new, :create, :edit, :update, :destroy, :user_index]
    get 'apartments', to: 'apartments#user_index', as: :user_apartments
  end

  get 'login', to: 'sessions#new', as: :login
  post 'login', to: 'sessions#create', as: :session
  delete 'logout', to: 'sessions#destroy', as: :logout
  get 'register', to: 'accounts#new', as: :register
  post 'register', to: 'accounts#create', as: :accounts

  root 'apartments#index'
end
