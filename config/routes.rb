Rails.application.routes.draw do

  devise_for :users
  root 'user_posts#top'
  
  resources :user_posts, only: [:new, :create, :index, :show, :edit, :destroy] do
    resources :user_post_comments, only: [:create, :destroy]
    resource :user_post_favorites, only: [:create, :destroy]
  end
  
  resources :users, only: [:show, :edit, :index, :update] do
    member do
      get :following, :followers
    end
  end
  
  resources :ski_slopes, only: [:show, :edit, :index, :create, :new, :update]
  resources :events, only: [:new, :create, :edit, :update, :index, :show]
end
