class EventsController < ApplicationController
  def new
    @event = Event.new
    @event.users << @current_user
  end

  def show
    @event = Event.find(params[:id])
  end

  def index
    @events = Event.all
  end

  def edit
    @event = Event.find(params[:id])
  end

  def create
    @event = Event.new(group_params)
    @event.user_id = current_user.id
    if @group.save
      redirect_to events_path
    else
      render :new
    end
  end
  
  def update
    @event = Event.find(params[:id])
    @event.user_id = current_user.id
    if @group.save
      redirect_to events_path
    else
      render :new
    end
  end

  private
  def group_params
    params.require(:group).permit(:title, :departure_date, :return_date, :deadline_date, :applicant_number, :transportation_expense, :description, :is_published)
  end

end
