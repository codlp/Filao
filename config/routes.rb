Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :users, only: [:show, :edit, :update]
  resources :projects do
    resources :tasks
  end
  resources :documents, only: [:index, :new, :create, :destroy]
  resources :messages, only: [:index, :new, :create, :update, :edit]
  get '/dashboard' => 'users#dashboard'

  # Routes for Google authentication
  get 'auth/:provider/callback', to: 'sessions#googleAuth'
  get 'auth/failure', to: redirect('/')
end



