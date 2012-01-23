# encoding: UTF-8
class SubjectsController < ApplicationController

  respond_to :html
  
  def index
    @subjects = Subject.all
    @title = "Объекты"
    respond_with @subjects
  end
  
  def show
    @subject = Subject.find(params[:id])
    respond_with @subject
  end
  
end
