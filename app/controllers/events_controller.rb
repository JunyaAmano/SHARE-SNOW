class EventsController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:edit, :update, :destroy]

  def new
    @event = Event.new
    @ski_slopes = SkiSlope.all
  end

  def show
    @event = Event.find(params[:id])
    @event_comment = EventComment.new
  end

  def index
    @events = Event.all.order(updated_at: :desc)
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
    if @event.update(event_params)
      redirect_to event_path(@event)
    else
      render :edit
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

  def correct_user
    event = Event.find(params[:id])
    unless event.user == current_user
      redirect_back(fallback_location: root_path)
    end
  end

end
