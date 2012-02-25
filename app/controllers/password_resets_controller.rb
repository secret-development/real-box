# encoding:utf-8
class PasswordResetsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by_email(params[:email])
    user.send_password_reset if user
    redirect_to sign_in_path
    flash[:notice] = "Пароль отправлен на ваш почтовый ящик"    
  end
end
