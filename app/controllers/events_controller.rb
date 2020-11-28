class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :create, :update, :applicants]
  before_action :correct_user, only: [:edit, :update, :destroy]

  def new
    @event = Event.new
    @ski_slopes = SkiSlope.all
  end

  def show
    @event = Event.find(params[:id])
    @event_comment = EventComment.new
    @user = @event.user
    if user_signed_in?
      @applied_events = EventUser.where(user_id: @user.id)
      @organized_events = Event.where(user_id: @user.id)
      @currentUserEntry = Entry.where(user_id: current_user.id)
      @userEntry = Entry.where(user_id: @user.id)
      unless @user.id == current_user.id
        @currentUserEntry.each do |cu|
          @userEntry.each do |u|
            if cu.room_id == u.room_id then
              @isRoom = true
              @roomId = cu.room_id
            end
          end
        end
        if @isRoom
        else
          @room = Room.new
          @entry = Entry.new
        end
      end
    end
  end

  def index
    @events = Event.all.order(updated_at: :desc)
    if user_signed_in?
      unless current_user.ski_slope.nil?
        @home_events = current_user.ski_slope.events.order(updated_at: :desc)
      end
    end
    @ski_slopes = SkiSlope.all
    # 検索タブの検索結果用
    @q = Event.ransack(params[:q])
    @q_events = @q.result(distinct: true)
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
    @ski_slopes = SkiSlope.all
    if @event.update(event_params)
      redirect_to event_path(@event)
    else
      render :edit
    end
  end

  def applicants
    @event = Event.find(params[:id])
    @user = @event.user
    @users = @event.event_users
    @applied_events = EventUser.where(user_id: @user.id)
    @organized_events = Event.where(user_id: @user.id)
    @currentUserEntry = Entry.where(user_id: current_user.id)
    @userEntry = Entry.where(user_id: @user.id)
    unless @user.id == current_user.id
      @currentUserEntry.each do |cu|
        @userEntry.each do |u|
          if cu.room_id == u.room_id then
            @isRoom = true
            @roomId = cu.room_id
          end
        end
      end
      if @isRoom
      else
        @room = Room.new
        @entry = Entry.new
      end
    end
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
