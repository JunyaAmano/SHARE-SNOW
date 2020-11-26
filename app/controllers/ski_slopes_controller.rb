class SkiSlopesController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_user!

  def index
    @slopes = SkiSlope.all
    @slope = SkiSlope.new
  end

  def edit
    @slopes = SkiSlope.all
    @slope = SkiSlope.find(params[:id])
  end

  def create
    @slope = SkiSlope.new(slope_params)
    if @slope.save
       redirect_to ski_slopes_path
    else
      @slopes = SkiSlope.all.page(params[:page]).per(10)
      render :index and return
    end
  end

  def show
    @slope = SkiSlope.find(params[:id])
    @events = @slope.events.order(updated_at: :desc)
  end

  def update
    @slope = SkiSlope.find(params[:id])
    if @slope.update(slope_params)
      redirect_to ski_slopes_path
    else
       render :edit and return
    end
  end

  private
  def slope_params
    params.require(:ski_slope).permit(:title, :description, :area)
  end

end
