class ChatsController < ApplicationController

  def create
    @group = Group.find(params[:group_id])
    @chat = current_user.chats.create!(chat_params)
    ActionCable.server.broadcast "group_channel", chat: @chat.template
  end

  private
  def chat_params
    params.require(:chat).permit(:content).merge(group_id: @group.id)
  end

end
