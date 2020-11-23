Rails.application.routes.draw do

  get 'rooms/show'
  devise_for :users
  root 'user_posts#top'

  resources :user_posts, only: [:new, :create, :index, :show, :edit, :destroy, :update] do
    resources :user_post_comments, only: [:create, :destroy]
    resource :user_post_favorites, only: [:create, :destroy]
  end

  resources :users, only: [:show, :edit, :index, :update] do
    member do
      get :following, :followers
    end
  end

  resources :events, only: [:new, :create, :index, :show, :edit, :destroy, :update] do
      resources :event_comments, only: [:create, :destroy]
      resource :event_users, only: [:create, :destroy]
      member do
        get :applicants
    end
  end

  resources :relationships, only: [:create, :destroy]
  resources :ski_slopes, only: [:show, :edit, :index, :create, :new, :update]
  resources :messages, only: [:create]
  resources :rooms, only: [:create,:show]

end
