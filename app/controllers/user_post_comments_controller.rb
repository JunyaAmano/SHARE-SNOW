class UserPostCommentsController < ApplicationController

  def create
    user_post = UserPost.find(params[:user_post_id])
    comment = current_user.user_post_comments.new(post_comment_params)
    comment.user_post_id = user_post.id
    if  comment.save
      redirect_to user_post_path(user_post)
    else
      @user_post = UserPost.find(params[:user_post_id])
      @post_comment = UserPostComment.new
      binding.pry
      render template: "user_posts/show"
    end
  end

  def destroy
    UserPostComment.find_by(id: params[:id], user_post_id: params[:user_post_id]).destroy
    redirect_to post_image_path(params[:post_image_id])
  end

  private
  def post_comment_params
    params.require(:user_post_comment).permit(:comment)
  end
end
