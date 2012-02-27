# encoding:utf-8
class PasswordResetsController < ApplicationController
  layout 'devise'
  def new
  end
  
  def create
    user = User.find_by_email(params[:email])
    user.send_password_reset if user
    redirect_to sign_in_path
    flash[:notice] = "Пароль отправлен на ваш почтовый ящик"    
  end
  
  def edit
    @user = User.find_by_password_reset_token!(params[:id])    
  end
  
  def update
    @user = User.find_by_password_reset_token!(params[:id])
    if @user.password_reset_sent_at < 2.hours.ago
      redirect_to new_password_reset_path
      flash[:notice] = "Время истекло"
    elsif
      @user.update_attributes(params[:user])
      redirect_to sign_in_path
      flash[:notice] = "Пароль изменен"
    else
      render 'edit'
    end    
  end
end
