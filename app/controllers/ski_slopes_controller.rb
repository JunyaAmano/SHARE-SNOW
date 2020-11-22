class SkiSlopesController < ApplicationController

  before_action :authenticate_user!

  def new
    @slope = SkiSlope.new
  end

  def index
    @slopes = SkiSlope.all.page(params[:page]).per(10)
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
    @slopes = @slope.products.order(created_at: :desc).all.page(params[:page]).per(5)
  end

  def edit
    @slope = SkiSlope.find(params[:id])
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
