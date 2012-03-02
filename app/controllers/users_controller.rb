# encoding:utf-8
class UsersController < ApplicationController
  before_filter :all_deny 
  respond_to :html
  load_and_authorize_resource
  def new
    @user = User.new
  end
  
  def create
    @user = User.create(params[:user])
    if @user.save
      flash[:notice] = "Сотрудник создан"
      respond_with(@user, :location => users_path)
    else
      render 'new'      
    end    
  end
  
  def index
    @users = User.all    
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def edit
    @user = User.find(params[:id])    
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:notice] = "Данные изменены"
      respond_with(@user)
    else
      render 'edit'      
    end    
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
    flash[:notice] = "Сотрудник удален"
  end
  
  def add_info
    @user = User.find(params[:id])
    respond_with(@user, :location => current_user)    
  end
  
end
