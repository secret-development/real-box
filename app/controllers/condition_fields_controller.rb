# -*- encoding : utf-8 -*-

class ConditionFieldsController < ApplicationController

  respond_to :html
  before_filter :all_deny
  before_filter :settings_deny
  before_filter :load_typesubject, :only => [:index]
  load_and_authorize_resource
  
  def index
    @conditionfields = ConditionField.all
    @title = "Fields for real estate"
    respond_with(@conditionfields)
  end
  
  def new
    @conditionfield = ConditionField.new
    @title = "Add a field"
    respond_with(@conditionfield)
  end
  
  def edit
    @conditionfield = ConditionField.find(params[:id])
    @title = "Editing field"
    respond_with(@conditionfield)
  end
  
  def create
    @conditionfield = ConditionField.new(params[:condition_field])
    if @conditionfield.save
      flash[:notice] = "The field successfully added"
      respond_with(@conditionfield, :location => condition_fields_path)
    else
      render 'new'
    end
  end
  
  def update
    @conditionfield = ConditionField.find(params[:id])
    if @conditionfield.update_attributes(params[:condition_field])
      flash[:notice] = "The field successfully updated"
      respond_with(@conditionfield, :location => condition_fields_path)
    else
      render 'edit'
    end
  end
  
  def destroy
    @conditionfield = ConditionField.find(params[:id])
    @conditionfield.destroy
    flash[:notice] = "The field successfully removed"
    redirect_to condition_fields_path
  end
  
  def load_typesubject
    @typesubjects = []
    ConditionField.all.each { |c| @typesubjects << c.typesubject}
    @typesubjects.uniq!
    @typesubjects
  end
  
end
