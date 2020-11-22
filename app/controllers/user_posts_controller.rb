class UserPostsController < ApplicationController

  before_action :authenticate_user!
  before_action :correct_user, only: [:edit, :update, :destroy]

  def index
    @user_post = UserPost.new
    @user_posts = UserPost.all.order(updated_at: :desc)
    @ranking_users_posts = UserPost.joins(:user_post_favorites).where(user_posts: {created_at: Time.now.all_month})
    .group("id").order("count(user_post_favorites.user_post_id) DESC")
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
    @user_post = UserPost.find(params[:id])
    if @user_post.update(post_params)
      redirect_to user_post_path(@user_post)
    else
      render :edit
    end
  end

  def destroy
    UserPost.find_by(id: params[:id]).destroy
    redirect_to user_posts_path
  end

  def top
    @events = Event.order(updated_at: :desc).limit(4)
    @user_posts = UserPost.order(updated_at: :desc).limit(10)
    @users = User.order(updated_at: :desc).limit(10)
  end

  def post_params
    params.require(:user_post).permit(:content, :image)
  end

  def correct_user
    @user_post = UserPost.find(params[:id])
    unless @user_post.user == current_user
      redirect_to user_path(current_user)
    end
  end
end
