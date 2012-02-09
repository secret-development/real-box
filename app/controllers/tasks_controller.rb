#encoding: UTF-8

class TasksController < ApplicationController
  
  respond_to :html
  
  def index
    @task = Task.all
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
      redirect_to tasks_path
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
  
end
