class EventsController < ApplicationController
  def new
    @event = Event.new
    @ski_slopes = SkiSlope.all
  end

  def show
    @event = Event.find(params[:id])
    @event_comment = EventComment.new
  end

  def index
    @events = Event.all
  end

  def edit
    @event = Event.find(params[:id])
    @ski_slopes = SkiSlope.all
  end

  def create
    @event = Event.new(event_params)
    @event.user_id = current_user.id
    if @event.save
      redirect_to event_path(@event)
    else
      @ski_slopes = SkiSlope.all
      render :new
    end
  end

  def update
    @event = Event.find(params[:id])
    @event.user_id = current_user.id
    if @event.save
      redirect_to event_path(@event)
    else
      render :new
    end
  end

  def applicants
    @user  = User.find(params[:id])
    @users = @user.event_users.all
    render 'events/show_applicant'
  end

  private
  def event_params
    params.require(:event).permit(:title, :departure_date, :return_date, :deadline_date, :applicant_number, :transportation_expense, :description, :is_published, :ski_slope_id, :image)
  end

end
