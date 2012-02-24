# encoding:utf-8
class SessionsController < ApplicationController
  #before_filter :all 
  respond_to :html
  layout 'devise'
  def new
  end
  
  def create
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect_to root_url
      flash[:notice] = "log in!"
    else
      flash[:notice] = "Invalid"
      render 'new'
    end    
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to sign_in_path
    flash[:notice] = "Successfully"    
  end
end
