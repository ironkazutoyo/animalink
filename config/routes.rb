Rails.application.routes.draw do

  get 'users/show'
  devise_for :users, controllers: {
    registrations: "users/registrations",
  }
  root to: 'articles#index'
  resources :users, only: [:show]
  resources :articles, only: [:new, :create]
end
