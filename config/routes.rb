Rails.application.routes.draw do
  devise_for :clients
  root 'home#index'
  resources :books, only: %i[index show]
  resources :purchases, only: %i[create]
  namespace :clients do
    resources :books, only: %i[index]
  end
end
