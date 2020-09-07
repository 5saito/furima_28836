Rails.application.routes.draw do
  get 'articles/index'
  get 'articles/new'
  devise_for :users
  root to: 'orders#index'
  resources :orders, only:[:create]
  resources :users, only: [:edit, :update, :create, :destroy, :new]
  resources :items
  resources :articles, only:[:index, :new, :create]
end
