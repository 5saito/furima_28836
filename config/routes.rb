Rails.application.routes.draw do
  get 'articles/index'
  get 'articles/new'
  devise_for :users
  root to: "items#index"
  resources :users, only: [:edit, :update, :create, :destroy, :new]
  resources :items do
    # resources :articles, only:[:index, :new, :create]
    resources :purchases, only:[:create, :new, :index]
  end
end
