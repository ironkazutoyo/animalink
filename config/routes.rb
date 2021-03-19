Rails.application.routes.draw do

  get 'users/show'
  devise_for :users, controllers: {
    registrations: "users/registrations",
  }
  root to: 'articles#index'
  resources :users, only: [:show] do
    resources :pets, only: [:new, :create, :show]
  end
  resources :articles, only: [:new, :create, :show, :edit, :update, :destroy]
end
