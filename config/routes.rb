# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'homes#index'

  resources :posts
  resources :users, only: [:index, :show]
  devise_for :users, skip: [:sessions]
  as :user do
    get 'login', to: 'devise/sessions#new', as: :new_user_session
    post 'login', to: 'devise/sessions#create', as: :user_session
    delete 'logout', to: 'devise/sessions#destroy', as: :destroy_user_session
    get 'signup', to: 'devise/registrations#new', as: :new_user
  end
end
