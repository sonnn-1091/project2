class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_sign_up_params, only: :create, if: :devise_controller?
  before_action :configure_update_params, only: :update, if: :devise_controller?

  protected

  def configure_sign_up_params
    devise_parameter_sanitizer.permit :sign_up, keys: [:name]
  end

  def configure_update_params
    devise_parameter_sanitizer.permit :account_update, keys: [:name]
  end
end
