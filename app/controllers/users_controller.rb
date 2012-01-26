# encoding: UTF-8

class UsersController < ApplicationController
  
  respond_to :html
  
  def index
    @users = User.all
    @title = "Персонал"
    respond_with @users
  end
  
  def show
    @user = User.find(params[:id])
    respond_with @user
  end
  
  def new
    @user = User.new
    @title = "Добавление персонала"
    respond_with @user
  end
  
  def edit
    @user = User.find(params[:id])
    @title = "Редактирование персонала"
    respond_with @user
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Персонал успешно добавлен"
      respond_with(@user, :location => user_path(@user))
    else
      render 'new'
    end
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:notice] = "Персонал успешно обновлен"
      respond_with(@user, :location => user_path(@user))
    else
      render 'edit'
    end
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "Персонал успешно удален"
    redirect_to users_path
  end
  
end
