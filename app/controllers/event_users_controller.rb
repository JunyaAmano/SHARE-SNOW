class EventUsersController < ApplicationController

  def create
    @event = Event.find(params[:event_id])
    @id_name = "#event-application-link-#{@event.id}"
    applicant = current_user.event_users.new(event_id: @event.id)
    applicant.save
  end

  def destroy
    @event = Event.find(params[:event_id])
    @id_name = "#event-application-link-#{@event.id}"    
    applicant = current_user.event_users.find_by(event_id: @event.id)
    applicant.destroy
  end
end
