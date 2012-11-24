# -*- encoding : utf-8 -*-

class TypesubjectsController < ApplicationController
  
  respond_to :html
  before_filter :all_deny
  before_filter :settings_deny
  load_and_authorize_resource
  
  def index
    @typesubjects = Typesubject.all
    @title = "Property types"
    respond_with(@typesubjects)
  end
  
  def new
    @typesubject = Typesubject.new
    @title = "Adding types"
    respond_with(@typesubject)
  end
  
  def edit
    @typesubject = Typesubject.find(params[:id])
    @title = "Editing type"
    respond_with(@typesubject)
  end
  
  def create
    @typesubject = Typesubject.new(params[:typesubject])
    if @typesubject.save
      flash[:notice] = "Object type has been added"
      respond_with(@typesubject, :location => typesubjects_path)
    else
      render 'new'
    end
  end
  
  def update
    @typesubject = Typesubject.find(params[:id])
    if @typesubject.update_attributes(params[:typesubject])
      flash[:notice] = "Object type has been successfully updated"
      respond_with(@typesubject, :location => typesubjects_path)
    else
      render 'edit'
    end
  end
  
  def destroy
    @typesubject = Typesubject.find(params[:id])
    @typesubject.destroy
    flash[:notice] = "Type of object is successfully removed"
    redirect_to typesubjects_path
  end
  
end
