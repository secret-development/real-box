# -*- encoding : utf-8 -*-

class ApplicationController < ActionController::Base
  protect_from_forgery  
  
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message    
  end
  
  def current_ability
    @current_ability ||= Ability.new(current_user)    
  end
  
  def tasks_size
    current_user.tasks.where(:done => false).size
  end
  
  helper_method :tasks_size
    
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
    
    def settings_deny
      unless current_user.role?
        redirect_to root_path
        flash[:alert] = "Запрещено!"
      end            
    end
  
    def time_work
      if current_user.role == false
        current_time = Time.current
        @w = Worktime.first
        if(@w.start_hour.nil? && @w.start_min.nil? && @w.end_hour.nil? && @w.end_min.nil?)
          true
        elsif(current_time.hour >= @w.start_hour && current_time.min >= @w.start_min && current_time.hour <= @w.end_hour && current_time.min <= @w.end_min)
          true
        else
          cookies.delete(:auth_token)
          redirect_to sign_in_path
          flash[:notice] = "Рабочий день закончился"
        end
      end
    end
        
end