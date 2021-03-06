class UsersController < ApplicationController

  before_action :authenticate_user!, only: [:edit, :update]
  before_action :correct_user, only: [:edit, :update]


  def show
    @user = User.find(params[:id])
    @user_posts = @user.user_posts.order(created_at: :desc)
    @applied_events = EventUser.where(user_id: @user.id).order(updated_at: :desc)
    @organized_events = Event.where(user_id: @user.id).order(updated_at: :desc)
    if user_signed_in?
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

  def index
    @title = "ユーザー一覧"
    @users = User.all.order(created_at: :desc)
    @snowboard_users = @users.where(riding_style: "スノーボード")
    @ski_users = @users.where(riding_style: "スキー")
    @ski_slopes = SkiSlope.all
    # 検索タブの検索結果用
    @q = User.ransack(params[:q])
    @q_users = @q.result(distinct: true).order(created_at: :desc)
  end

  def edit
    @user = User.find(params[:id])
    @ski_slopes = SkiSlope.all
  end

  def update
    @ski_slopes = SkiSlope.all
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id)
    else
      render "edit"
    end
  end

  def following
    @title = "フォローユーザー"
    @title2 = "フォロユーザーはいません"
    @user  = User.find(params[:id])
    @users = @user.following.all.order(created_at: :desc)
    render 'users/show_follow'
  end

  def followers
    @title = "フォロワーユーザー"
    @title2 = "フォロワーはいません"
    @user  = User.find(params[:id])
    @users = @user.followers.all.order(created_at: :desc)
    render 'users/show_follow'
  end


  private
  def user_params
    params.require(:user).permit(:name, :introduction, :image, :age, :is_owned, :gender, :riding_style, :ski_slope_id)
  end

  def correct_user
    user = User.find(params[:id])
    unless user == current_user
      redirect_to user_path(current_user)
    end
  end

end
