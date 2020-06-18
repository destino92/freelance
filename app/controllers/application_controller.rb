class ApplicationController < ActionController::Base
  include CurrentBasket

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_basket


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:full_name])
     devise_parameter_sanitizer.permit(:account_update, keys: [:full_name])
  end

  def after_sign_in_path_for(resource)
    dashboard_path
  end
end

