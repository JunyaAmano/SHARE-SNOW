class EventUsersController < ApplicationController

  def create
    event = Event.find(params[:event_id])
    applicant = current_user.event_users.new(event_id: event.id)
    applicant.save
    redirect_back(fallback_location: root_path)
  end

  def destroy
    event = Event.find(params[:event_id])
    applicant = current_user.event_users.find_by(event_id: event.id)
    applicant.destroy
    redirect_back(fallback_location: root_path)
  end
end
