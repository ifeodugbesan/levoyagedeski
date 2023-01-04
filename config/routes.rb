Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#home'

  resources :posts, except: [:show] do
    resources :comments, only: [:new, :create]
    resources :likes, only: [:new, :create]
  end

  resources :comments, only: [:destroy]
  resources :likes, only: [:destroy]

  resources :users, only: [:show] do
    collection do
      get "all"
    end
  end

  get 'info', to: 'pages#info'
  get 'all_users', to: 'pages#all_users'
  get 'seen_pwa', to: 'pages#seen_pwa'
  get 'toggle_dark_mode', to: 'pages#toggle_dark_mode'
  get 'no_user', to: 'users#no_user'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
