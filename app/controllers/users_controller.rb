# encoding: UTF-8

class UsersController < ApplicationController
  
  respond_to :html
  helper_method :sort_column, :sort_direction
  
  def index
    @users = User.search(params[:search]).order(sort_column + " " + sort_direction).page(params[:page]).per(10)
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
      redirect_to users_path
    else
      render 'new'
    end
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:notice] = "Персонал успешно обновлен"
      redirect_to users_path
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
  
  private
  
  def sort_column
    Task.column_names.include?(params[:sort]) ? params[:sort] : "first_name, last_name, middle_name, email, adress, phone"    
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"    
  end
  
end
