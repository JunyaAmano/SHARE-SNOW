class GroupChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    Chat.create! content: data['message'], user: current_user, group: Group.find(params['group_id']))
  end
end
