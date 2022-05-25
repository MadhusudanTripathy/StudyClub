class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?


  def after_sign_up_path_for(resource)
    questions_path
  end
  def after_sign_in_path_for(resource)
    questions_path
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:full_name, :user_name, :phone, :gender, :dob])
  end
end
