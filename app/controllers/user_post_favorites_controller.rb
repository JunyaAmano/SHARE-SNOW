class UserPostFavoritesController < ApplicationController

  def create
    user_post = UserPost.find(params[:User_post_id])
    favorite = current_user.user_post_favorites.new(post_image_id: post_image.id)
    favorite.save
    redirect_to post_image_path(post_image)
  end

  def destroy
    user_post = UserPost.find(params[:User_post_id])
    favorite = current_user.user_post_favorites.new(post_image_id: post_image.id)
    favorite.destroy
    redirect_to post_image_path(post_image)
  end

end
