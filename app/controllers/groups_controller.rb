class GroupsController < ApplicationController
  before_action :authenticate_user!, only: [:show, :create]
  before_action :correct_user, only: [:destroy]


  def show
    @group = Group.find(params[:id])
    @chats = @group.chats.includes(:user).last(100)
    @groups = Group.all.order(updated_at: :desc)
  end

  def show_additionally
    last_id = params[:oldest_chat_id].to_i - 1
    @chats = Chat.includes(:user).order(:id).where(id: 1..last_id).last(50)
  end

  def index
    @group = Group.new
    @groups = Group.all.order(updated_at: :desc)
  end

  def create
    @group = Group.new(group_params)
    @group.user_id = current_user.id
    if @group.save
      redirect_to group_path(@group)
    else
      @groups = Group.all.order(updated_at: :desc)
      render :index
    end
  end

  def destroy
    Group.find_by(id: params[:id]).destroy
    redirect_to groups_path
  end

  private
  def group_params
    params.require(:group).permit(:name)
  end

  def correct_user
    group = Group.find(params[:id])
    unless group.user == current_user
      redirect_back(fallback_location: root_path)
    end
  end

end
