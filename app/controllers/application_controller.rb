class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_action_cable_identifier

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  private

  def set_action_cable_identifier
    unless controller_name == 'homes'
      cookies.encrypted[:user_id] = current_user.try(:id)
    end
  end
end
