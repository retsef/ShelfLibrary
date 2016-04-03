Rails.application.routes.draw do
  devise_for :user

  authenticated :user do
    root to: 'backend/dashboard#index', as: :authenticated_root
  end

  root 'welcome#index'

  resources :books, only: [:index, :show]
  resources :authors, only: [:index, :show]
  resources :collections, only: [:index, :show]


  resources :static_pages
  get '/netiquette', to: 'static_pages#netiquette'
  get '/privacy', to: 'static_pages#privacy'

  namespace :backend do
    root 'dashboard#index'

    resources :dashboard

    resources :books
    resources :authors
    resources :collections
    resources :categories
    resources :publishers
  end

end
