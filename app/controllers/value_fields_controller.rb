# -*- encoding : utf-8 -*-

class ValueFieldsController < ApplicationController

  respond_to :html
  before_filter :all_deny
  before_filter :settings_deny
  before_filter :load_typesubject, :only => [:index]
  load_and_authorize_resource
  
  def index
    @valuefields = ValueField.all
    @title = "Values ​​for additional fields"
    respond_with(@valufields)
  end
  
  def new
    @valuefield = ValueField.new
    @title = "Adding values ​​to additional fields"
    respond_with(@valuefield)
  end
  
  def edit
    @valuefield = ValueField.find(params[:id])
    @title = "Editing value"
    respond_with(@valuefield)
  end
  
  def create
    @valuefield = ValueField.new(params[:value_field])
    if @valuefield.save
      flash[:notice] = "Value successfully created"
      respond_with(@valuefield, :location => value_fields_path)
    else
      render 'new'
    end
  end
  
  def update
    @valuefield = ValueField.find(params[:id])
    if @valuefield.update_attributes(params[:value_field])
      flash[:notice] = "Value successfully updated"
      respond_with(@valuefield, :location => value_fields_path)
    else
      render 'edit'
    end
  end
  
  def destroy
    @valuefield = ValueField.find(params[:id])
    @valuefield.destroy
    flash[:notice] = "Value successfully removed"
    redirect_to value_fields_path
  end
  
  def load_typesubject
    @typesubjects = []
    ValueField.all.each { |v| @typesubjects << v.condition_field.typesubject}
    @typesubjects.uniq!
  end
  
  
end
