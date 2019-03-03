Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :users, only: [:show, :edit, :update]

  resources :projects do
    resources :tasks, only: [:new, :create]
  end

  resources :steps, only: [:index, :show, :edit, :update, :edit, :update, :mark_as_completed] do
    resources :tasks, only: [:show, :index]
  end

  resources :tasks, only: [:edit, :update, :destroy] do
    member do
      get :mark_as_done
      get :mark_as_undone
    end
  end

  resources :tasks, only: :show do
    resources :documents, only: [:new, :create]
    resources :messages, only: [:index, :create, :new]
  end

  resources :documents, only: [:index, :destroy]

  resources :messages, only: [:index, :new, :create, :update, :edit]

  get '/dashboard' => 'users#dashboard'

  # Routes for Google authentication
  get 'auth/:provider/callback', to: 'sessions#googleAuth'
  get 'auth/failure', to: redirect('/')
end

