# encoding:utf-8
class SessionsController < ApplicationController
  #before_filter :all 
  respond_to :html
  layout 'devise'
  def new
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
      #session[:user_id] = user.id
      flash[:notice] = "Вход успешен"
      redirect_to root_url
    else
      flash[:notice] = "Неправильный почтовый адрес или пароль!"
      render 'new'
    end    
  end
  
  def destroy
    #session[:user_id] = nil
    cookies.delete(:auth_token)
    redirect_to sign_in_path
    flash[:notice] = "Successfully"    
  end
end
