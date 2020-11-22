class UsersController < ApplicationController

  before_action :authenticate_user!
  before_action :correct_user, only: [:edit, :update]


  def show
    @user = User.find(params[:id])
    @user_posts = @user.user_posts
    @applied_events = EventUser.where(user_id: @user.id)
    @organized_events = Event.where(user_id: @user.id)
  end

  def index
    @title = "ユーザー一覧"
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id)
    else
      render "edit"
    end
  end

  def following
    @title = "フォローユーザー"
    @user  = User.find(params[:id])
    @users = @user.following.all
    render 'users/show_follow'
  end

  def followers
    @title = "フォロワーユーザー"
    @user  = User.find(params[:id])
    @users = @user.followers.all
    render 'users/show_follow'
  end


  private
  def user_params
    params.require(:user).permit(:name, :introduction, :image, :age, :is_owned, :gender, :riding_style)
  end

  def correct_user
    event = Event.find(params[:id])
    unless event.user == current_user
      redirect_to user_path(current_user)
    end
  end

end
