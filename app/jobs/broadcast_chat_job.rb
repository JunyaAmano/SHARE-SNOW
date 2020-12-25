class BroadcastChatJob < ApplicationJob
  queue_as :default

  def perform(message)
      pp message.group_id
      ActionCable.server.broadcast "group_channel_#{message.group_id}", message: render_chat(message)
  end

  private
    def render_chat(message)
      ApplicationController.renderer.render(partial: 'groups/chat', locals: { chat: message })
    end

end
