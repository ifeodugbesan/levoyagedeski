Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#home'

  resources :posts, except: [:show] do
    resources :comments, only: [:new, :create]
    resources :likes, only: [:new, :create]
  end

  resources :comments, only: [:destroy]
  resources :likes, only: [:destroy]

  resources :users, only: [:show]

  resources :conversations do
    resources :messages
  end

  get 'seen_pwa', to: 'pages#seen_pwa'
  get 'toggle_dark_mode', to: 'pages#toggle_dark_mode'
  get 'no_user', to: 'users#no_user'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
