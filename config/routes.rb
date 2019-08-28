Rails.application.routes.draw do

  root 'posts#index'
  #devise_for :users
  devise_for :users,
             :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :posts, only: [:index, :create] do
    resources :comments, only: [:new, :create]
    resources :likes, only:  [:create, :destroy]
  end
  resources :friendships, only: [:create, :update]
  resources :users, only: [:show]
  patch 'accept_friend/:id', to: 'friendships#accept_friend', as: 'accept_friend'
end
