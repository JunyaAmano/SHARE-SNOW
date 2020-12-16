class UserPostCommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:destroy]

  def create
    @user_post = UserPost.find(params[:user_post_id])
    @post_comment = UserPostComment.new
    comment = current_user.user_post_comments.new(post_comment_params)
    comment.user_post_id = @user_post.id
    if comment.save
      @user_post.create_notification_post_comment!(current_user, comment.id)
    else
      # バリデーションエラーメッセージなし
      redirect_to user_post_path(@user_post)
    end
  end

  def destroy
    @user_post = UserPost.find(params[:user_post_id])
    @post_comment = UserPostComment.new
    UserPostComment.find_by(id: params[:id], user_post_id: params[:user_post_id]).destroy
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
