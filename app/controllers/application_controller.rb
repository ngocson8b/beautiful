class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?
  
  protected
  def authenticated_user!
    if user_signed_in?
      authenticate_user!
    else
      redirect_to new_user_session_path, :notice => 'You have to log in first'
    end
  end

  def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys:[:email, :password])
      devise_parameter_sanitizer.permit(:account_update, keys: [:email, :password, :current_password, :avatar])
  end
end
