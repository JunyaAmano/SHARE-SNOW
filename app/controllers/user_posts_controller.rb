class UserPostsController < ApplicationController
  def index
    @user_post = UserPost.new
    @user_posts = UserPost.all
  end

  def create
    @user_post = UserPost.new(post_params)
    @user_post.user_id = current_user.id
    if @user_post.save
      redirect_to user_posts_path
    else
      @user_posts = UserPost.all
      render :index
    end
  end


  def show
    @user_post = UserPost.find(params[:id])
    @post_comment = UserPostComment.new
  end

  def edit
    @user_post = UserPost.find(params[:id])
  end

  def update
  end

  def destroy
    UserPost.find_by(id: params[:id]).destroy
    redirect_to user_posts_path
  end

  def top
  end

  def post_params
    params.require(:user_post).permit(:content, :image)
  end

  def correct_user
    book = Book.find(params[:id])
    if current_user.id != book.user_id
    redirect_to books_path
    end
  end
end
