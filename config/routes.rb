# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'homes#index'

  get '/user-post/:id', to: 'posts#user_posts', as: :user_post
  get 'like/:id', to: 'comments#save_like', as: :like
  get 'comment/:id', to: 'comments#new', as: :new_comment
  post 'comment/:id', to: 'comments#create', as: :comments

  get 'friends/:id', to: 'friends#friends', as: :friends
  get 'pending-friends/:id', to: 'friends#pending_friends', as: :pending_friends
  get 'request-friendship/:id', to: 'friends#create', as: :request_friend
  get 'friend-requests', to: 'friends#friend_requests', as: :friend_request
  get 'accept-friendship/:id', to: 'friends#accept_friend', as: :accept_friend

  devise_for :users, skip: [:sessions], controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  as :user do
    get 'login', to: 'devise/sessions#new', as: :new_user_session
    post 'login', to: 'devise/sessions#create', as: :user_session
    delete 'logout', to: 'devise/sessions#destroy', as: :destroy_user_session
    get 'signup', to: 'devise/registrations#new', as: :new_user
  end

  resources :posts
  resources :users, only: [:index, :show]
end
