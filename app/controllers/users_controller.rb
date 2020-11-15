class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @user_posts = @user.user_posts
  end

  def index
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


  private
  def user_params
    params.require(:user).permit(:name, :introduction, :image, :age, :is_owned, :gender, :riding_style)
  end

end
