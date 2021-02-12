class ApplicationController < ActionController::Base
  include CurrentBasket

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_basket
  before_action :set_action_cable_identifier


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:full_name, :phone])
     devise_parameter_sanitizer.permit(:account_update, keys: [:full_name, :phone])
  end

  def after_sign_in_path_for(resource)
    dashboard_path
  end

  def set_action_cable_identifier
    cookies.encrypted[:user_id] = current_user&.id
  end

end

