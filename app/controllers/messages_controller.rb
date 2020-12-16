class MessagesController < ApplicationController
  before_action :authenticate_user!


  def create
    @message = Message.new(message_params)
    @room = @message.room
    @message.user_id = current_user.id
    @id_name = "#message-link-#{@room.id}"
    if @message.save
      @roommembernotme=Entry.where(room_id: @room.id).where.not(user_id: current_user.id)
      @theid=@roommembernotme.find_by(room_id: @room.id)
      notification = current_user.active_notifications.new(
        room_id: @room.id,
        message_id: @message.id,
        visited_id: @theid.user_id,
        visitor_id: current_user.id,
        action: 'message'
        )
      if notification.visitor_id == notification.visited_id
        notification.checked = true
      end
      if notification.valid?
        notification.save
      end

      redirect_to room_path(@message.room)
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def message_params
      params.require(:message).permit(:room_id, :message)
  end
end
