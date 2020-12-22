class ChatBroadcastJob < ApplicationJob
  queue_as :default

  def perform(message)
    ActionCable.server.broadcast 'group_channel_#{chat.group_id}', message: render_message(message)
  end
  
  private
    def render_message(message)
      ApplicationController.renderer.render(partial: 'chats/message', locals: { message: message })
    end
  
end
