class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  # before_action :configure_sign_up_params, only: [:create]

  before_action :set_q_for_hospital

  def set_q_for_hospital
    @q_header = Hospital.includes(:clinical_departments).ransack(params[:q])
  end

  def after_sign_up_path_for(_resource)
    root_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name hospital_id])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name hospital_id])
  end
end
