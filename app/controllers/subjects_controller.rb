# encoding:utf-8
class SubjectsController < ApplicationController
  respond_to :html
  
  def index
    @subjects = Subject.all
    respond_with(@subjects)
  end
  
  def show
    @subject = Subject.find(params[:id])
    respond_with(@subject)
  end

  def new
    @subject = Subject.new
    respond_with(@subject)
  end
  
  def edit
    @subject = Subject.find(params[:id])
    respond_with(@subject)
  end
  
  def create
    @subject = Subject.new(params[:subject])
    if @subject.save
      flash[:notice] = "Объект успешно создан"
      respond_with(@subject, :location => @subject)
    else
      render 'new'
    end
  end
  
  def update
    @subject = Subject.find(params[:id])
    if @subject.update_attributes(params[:subject])
      flash[:notice] = "Объект успешно обновлён"
      respond_with(@subject, :location => @subjects)
    else
      render 'edit'
    end
  end

  def destroy
    @subject = Subject.find(params[:id])
    @subject.destroy
    flash[:notice] = "Объект успешно удалён"
    redirect_to subjects_path
  end

end
