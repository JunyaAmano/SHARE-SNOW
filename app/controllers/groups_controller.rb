class GroupsController < ApplicationController

  def show
    @group = Group.find(params[:id])
    @chats = @room.chats
  end
end
