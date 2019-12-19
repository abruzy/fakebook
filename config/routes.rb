# frozen_string_literal: true

Rails.application.routes.draw do
  # get 'posts/index', to: 'posts#index', as: 'posts_index_path'
  # get 'posts/:id', to: 'posts#show', as: 'posts_show_path'
  # get 'posts/new', to: 'posts#new', as: 'posts_new_path'
  root to: 'homes#index'

  resources :posts
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  devise_for :users, skip: [:sessions]
  as :user do
    get 'login', to: 'devise/sessions#new', as: :new_user_session
    post 'login', to: 'devise/sessions#create', as: :user_session
    delete 'logout', to: 'devise/sessions#destroy', as: :destroy_user_session
    get 'signup', to: 'devise/registrations#new', as: :new_user
  end
end
