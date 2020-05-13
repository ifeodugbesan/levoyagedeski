Rails.application.routes.draw do
  get 'project_members/new'
  get 'project_members/create'
  get 'project_members/destroy'
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
  resources :users, only: [:show]
  resources :resources, except: [:show]
  resources :articles
  resources :careers do
    resources :project_members, only: [:new, :create]
  end
  resources :project_members, only: [:destroy] do
    member do
      get :accept_membership
      get :reject_membership
    end
  end
  resources :conversations do
    resources :messages
  end
  get 'seen_pwa', to: 'pages#seen_pwa'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
