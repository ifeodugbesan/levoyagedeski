Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :posts do
    resources :comments, only: [:new, :create]
    resources :likes, only: [:new, :create]
  end
  resources :comments, only: [:destroy]
  resources :likes, only: [:destroy]
  resources :batches, only: [:show] do
    resources :events, only: [:new, :create, :edit, :update]
  end
  resources :events, only: [:destroy]
  get '/seen_pwa', to: 'pages#seen_pwa'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
