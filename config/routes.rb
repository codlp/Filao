Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :users, only: [:show, :edit, :update]

  resources :projects do
    member do
      get :is_done
    end
    resources :tasks, only: [:new, :create]
  end

  resources :tasks, only: [:edit, :update, :destroy]
  resources :tasks, only: :show do
    resources :documents, only: [:new, :create]
    resources :messages, only: [:index, :create, :new]
  end

  resources :documents, only: [:index, :destroy]

  get '/dashboard' => 'users#dashboard'

  # Routes for Google authentication
  get 'auth/:provider/callback', to: 'sessions#googleAuth'
  get 'auth/failure', to: redirect('/')
end



