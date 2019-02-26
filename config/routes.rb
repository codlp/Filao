Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :projects do
    resources :tasks
  end
  resources :documents, only: [:index, :new, :create, :destroy]
  resources :messages, only: [:index, :new, :create, :update, :edit]
end
