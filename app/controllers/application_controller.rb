class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :introduction, :image, :age, :is_owned, :gender, :riding_style, :ski_slope_id])
    @ski_slopes = SkiSlope.all
  end
end
