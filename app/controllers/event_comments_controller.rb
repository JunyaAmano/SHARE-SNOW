class EventCommentsController < ApplicationController

  def create
    event = Event.find(params[:event_id])
    comment = current_user.event_comments.new(event_comment_params)
    comment.event_id = event.id
    if  comment.save
      redirect_to event_path(event)
    else
      @event = Event.find(params[:event_id])
      @event = Event.new
      render template: "events/show"
    end
  end

  def destroy
    EventComment.find_by(id: params[:id], event_id: params[:event_id]).destroy
    redirect_to event_path(params[:event_id])
  end

  private
  def event_comment_params
    params.require(:event_comment).permit(:comment)
  end

end
