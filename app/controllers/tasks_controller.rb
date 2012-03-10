# -*- encoding : utf-8 -*-

class TasksController < ApplicationController
  before_filter :all_deny
  respond_to :html
  helper_method :sort_column, :sort_direction
  load_and_authorize_resource
  
  def index
    @tasks = Task.search(params[:search]).order(sort_column + " " + sort_direction).page(params[:page]).per(10)
    @title = "Задачи"
  end

  def show
    @task = Task.find(params[:id])
    @title = @task.title
    respond_with @task
  end

  def new
    @task = Task.new
    @title = "Добавление задачи"
    respond_with @task
  end

  def edit
    @task = Task.find(params[:id])
    @title = "Редактирование задачи"
  end

  def create
    @task = Task.new(params[:task])
    if @task.save
      flash[:notice] = "Задача успешно добавлена"
      respond_with(@task)
    else
      render 'new'
    end
  end

  def update
    @task = Task.find(params[:id])
    if @task.update_attributes(params[:task])
      flash[:notice] = "Задача успешно обновлена"
      redirect_to tasks_path
    else
      render 'edit'
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    flash[:notice] = "Задача успешно удалена"
    redirect_to tasks_path
  end

  private
  
  def sort_column
    Task.column_names.include?(params[:sort]) ? params[:sort] : "title"    
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"    
  end
  
end
