class GroupsController < ApplicationController
  def index
    @group = Group.new
    @group.users << current_user
    @groups = Group.all.order(updated_at: :desc)

  end

  def show
    @group = Group.find(params[:id])
    @chats = @group.chats.includes(:user).order(:id).last(100)
    @chat = current_user.chats.build
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to group_path(@group)
    else
      @groups = Group.all.order(updated_at: :desc)
      render :index
    end
  end

  private
    def group_params
      params.require(:group).permit(:name, { user_ids: current_user.id })
    end
end
