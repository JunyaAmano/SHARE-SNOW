class UserPostCommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:destroy]

  def create
    user_post = UserPost.find(params[:user_post_id])
    comment = current_user.user_post_comments.new(post_comment_params)
    comment.user_post_id = user_post.id
    if  comment.save
      redirect_to user_post_path(user_post)
    else
      # バリデーションエラーメッセージなし
      redirect_to user_post_path(event)
  end

  def destroy
    UserPostComment.find_by(id: params[:id], user_post_id: params[:user_post_id]).destroy
    redirect_to user_post_path(params[:user_post_id])
  end

  private
  def post_comment_params
    params.require(:user_post_comment).permit(:comment)
  end

  def correct_user
    user_post_comment = UserPostComment.find(params[:id])
    unless user_post_comment.user == current_user
      redirect_back(fallback_location: root_path)
    end
  end
end

