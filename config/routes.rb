Rails.application.routes.draw do
  get 'articles/index'
  get 'articles/new'
  devise_for :users
  root to: "items#index"
  resources :users, only: [:edit, :update, :create, :destroy, :new]
  resources :items
  resources :articles, only:[:index, :new, :create]
end
