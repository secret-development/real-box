# encoding:utf-8
class SessionsController < ApplicationController
  #before_filter :all 
  respond_to :html
  layout 'devise'
  def new
  end
  
  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_url
      flash[:notice] = "Вход успешен"
    else
      flash[:notice] = "Неправильный почтовый адрес или пароль!"
      render 'new'
    end    
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to sign_in_path
    flash[:notice] = "Successfully"    
  end
end
