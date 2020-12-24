class GroupChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    stream_from "group_channel_#{params['group_id']}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(message)
    chat = Chat.new(content: message['message'][0], user_id: message['message'][1].to_i, group_id: message['message'][2].to_i)
    chat.save
    # ActionCable.server.broadcast "group_channel_#{params['group_id']}", content: message['message'][0], user_id: message['message'][1].to_i, group_id: message['message'][2].to_i # フロントへ返します
  end
end
