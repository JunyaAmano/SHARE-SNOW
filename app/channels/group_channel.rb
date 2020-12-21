class GroupChannel < ApplicationCable::Channel
  def subscribed
    stream_from "group_channel"
    # stream_from "some_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
