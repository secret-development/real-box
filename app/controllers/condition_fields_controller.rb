# encoding:utf-8
class ConditionFieldsController < ApplicationController

  respond_to :html
  
  def index
    @conditionfields = ConditionField.all
    @title = "Поля для недвижимости"
  end
  
  def new
    @conditionfield = ConditionField.new
    @title = "Добавление поля"
  end
  
  def edit
    @conditionfield = ConditionField.find(params[:id])
    @title = "Редактирование поля"
  end
  
  def create
    @conditionfield = ConditionField.new(params[:condition_field])
    if @conditionfield.save
      flash[:notice] = "Поле успешно добавлено"
      respond_with(@conditionfield, :location => condition_fields_path)
    else
      render 'new'
    end
  end
  
  def update
    @conditionfield = ConditionField.find(params[:id])
    if @conditionfield.update_attributes(params[:condition_field])
      flash[:notice] = "Поле успешно обновлено"
      respond_with(@conditionfield, :location => condition_fields_path)
    else
      render 'edit'
    end
  end
  
  def destroy
    @conditionfield = ConditionField.find(params[:id])
    @conditionfield.destroy
    flash[:notice] = "Поле успешно удалено"
    redirect_to condition_fields_path
  end
  
end