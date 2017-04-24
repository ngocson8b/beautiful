class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  protected
  def authenticated_user!
    if user_signed_in?
      authenticate_user!
    else
      redirect_to new_user_session_path, :notice => 'You have to log in first'
    end
  end
end
