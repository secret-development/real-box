# -*- encoding : utf-8 -*-

class SessionsController < ApplicationController 
  
  before_filter :load_worktime, :only => [:new, :create]
  
  respond_to :html
  layout 'devise'
  
  def new
    @title = "Sign in"
  end
  
  def create
    user = User.authenticate(params[:email], params[:password])  
    #user = User.find_by_email(params[:email])
    if user #&& user.authenticate(params[:password])
      if params[:remember_me]
        cookies.permanent[:auth_token] = user.auth_token
      else
        cookies[:auth_token] = user.auth_token
      end
      if user.role == false
        current_time  = Time.current
        if(@w.start_hour.nil? && @w.start_min.nil? && @w.end_hour.nil? && @w.end_min.nil?)
          flash[:notice] = "Welcome"
          user.last_sign
          redirect_to root_url
        elsif(current_time.hour >= @w.start_hour && current_time.min >= @w.start_min && current_time.hour <= @w.end_hour)
          if(current_time.hour == @w.end_hour && current_time.min > @w.end_min)
            cookies.delete(:auth_token)
            redirect_to sign_in_path
            flash[:alert] = "The working day is over"
          else
            flash[:notice] = "Welcome"
            user.last_sign
            redirect_to root_url  
          end
        else
          cookies.delete(:auth_token)
          redirect_to sign_in_path
          flash[:alert] = "The working day is over"
        end
      else
        #session[:user_id] = user.id
        flash[:notice] = "Welcome"
        user.last_sign
        redirect_to root_url  
      end
    else
      flash[:alert] = "Invalid email address or password!"
      render 'new'
    end    
  end
  
  def destroy
    cookies.delete(:auth_token)
    redirect_to sign_in_path
    flash[:notice] = "You have successfully logged out"
  end
  
  private 
  
    def load_worktime
      @w = Worktime.first
    end
end