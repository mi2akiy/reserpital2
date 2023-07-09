class ApplicationController < ActionController::Base
  # before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :configure_sign_up_params, only: [:create]

  def after_sign_up_path_for(resource)
    root_path
  end

  protected
  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :hospital_id])
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:name, :hospital_id])
  # end
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :sex, :birthday, :email, :telephone_number, :postal_code, :address, :password, :password_confirmation])
  end
end
