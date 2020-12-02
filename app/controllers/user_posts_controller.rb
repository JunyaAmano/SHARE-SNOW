class UserPostsController < ApplicationController

  before_action :authenticate_user!, only: [:edit, :update, :destroy, :create]
  before_action :correct_user, only: [:edit, :update, :destroy]

  def index
    @user_post = UserPost.new
    @user_posts = UserPost.all.order(updated_at: :desc)
    @ranking_users_posts = UserPost.joins(:user_post_favorites).where(user_posts: {created_at: Time.now.all_month})
    .group("id").order("count(user_post_favorites.user_post_id) DESC")
  end

  def create
    @user_post = UserPost.new(post_params)
    @user_post.score = Language.get_data(post_params[:content])
    @user_post.user_id = current_user.id
    if @user_post.save
      redirect_to user_posts_path
    else
      @user_posts = UserPost.all.order(updated_at: :desc)
      @ranking_users_posts = UserPost.joins(:user_post_favorites).where(user_posts: {created_at: Time.now.all_month})
      render :index
    end
  end

  def show
    @user_post = UserPost.find(params[:id])
    @post_comment = UserPostComment.new
    @user = @user_post.user
    if user_signed_in?
      @applied_events = EventUser.where(user_id: @user.id)
      @organized_events = Event.where(user_id: @user.id)

      @currentUserEntry = Entry.where(user_id: current_user.id)
      @userEntry = Entry.where(user_id: @user.id)
      unless @user.id == current_user.id
        @currentUserEntry.each do |cu|
          @userEntry.each do |u|
            if cu.room_id == u.room_id then
              @isRoom = true
              @roomId = cu.room_id
            end
          end
        end
        if @isRoom
        else
          @room = Room.new
          @entry = Entry.new
        end
      end
    end
  end

  def edit
    @user_post = UserPost.find(params[:id])
  end

  def update
    @user_post = UserPost.find(params[:id])
    @user_post.score = Language.get_data(post_params[:content])
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
