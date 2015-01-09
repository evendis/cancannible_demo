class ApplicationController < ActionController::Base
  protect_from_forgery

  # This is optional. Decided to catch CanCan access errors here (else the app would just throw a fatal error)
  rescue_from CanCan::AccessDenied do |exception|
    flash[:alert] = exception.message
    redirect_to(root_path)
  end

end
