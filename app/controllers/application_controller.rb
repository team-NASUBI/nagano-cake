class ApplicationController < ActionController::Base
  before_action :configure_parmitted_parameters, if: :devise_controller?
  
  protected
  
  def configure_parmitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :kana_last_name, :kana_first_name, :postal_code, :address, :telephone_number])
  end
end
