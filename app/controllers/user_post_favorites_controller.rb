class UserPostFavoritesController < ApplicationController

  before_action :authenticate_user!

  def create
    user_post = UserPost.find(params[:user_post_id])
    favorite = current_user.user_post_favorites.new(user_post_id: user_post.id)
    favorite.save
    user_post.create_notification_favorite!(current_user)
    redirect_back(fallback_location: root_path)
  end

  def destroy
    user_post = UserPost.find(params[:user_post_id])
    favorite = current_user.user_post_favorites.find_by(user_post_id: user_post.id)
    favorite.destroy
    redirect_back(fallback_location: root_path)
  end

end
