# encoding:utf-8
class ApplicationController < ActionController::Base
  before_filter :authenticate_user!
  #check_authorization :unless => :devise_controller?
  protect_from_forgery
  
  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = exception.message
    #flash[:notice] = "Доступ запрещен!"
    redirect_to root_url    
  end
  
end
