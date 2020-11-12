Rails.application.routes.draw do
  devise_for :users
  root 'user_posts#index'
  resources :user_posts, only: [:new, :create, :index, :show, :edit, :destroy] do
    resources :user_post_comments, only: [:create, :destroy]
    resource :user_post_favorites, only: [:create, :destroy]
  end
  resources :users, only: [:show, :edit, ]
end
