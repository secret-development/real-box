# encoding:utf-8
class ApplicationController < ActionController::Base
  protect_from_forgery
  
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to sign_in_path, :alert => exception.message    
  end
  
  def current_ability
    @current_ability ||= Ability.new(current_user)    
  end
    
  private
  
    def current_user
      @current_user ||= User.find_by_auth_token(cookies[:auth_token]) if cookies[:auth_token]     
    end
    
    helper_method :current_user
    
    def all_deny
      unless current_user#User.find_by_id(session[:user_id])
        redirect_to sign_in_path
      end
    end
        
end
