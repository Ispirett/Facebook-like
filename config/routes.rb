Rails.application.routes.draw do
  root 'posts#index'
  devise_for :users

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :posts, only: [:index, :create] do
    resources :comments, only: [:new, :create]
    resources :likes, only:  [:create, :destroy]
  end
  resource :friendships, only: [:create, :update]
  patch 'accept_friend/:id', to: 'friendships#accept_friend', as: 'accept_friend'
end
