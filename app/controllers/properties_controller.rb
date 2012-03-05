# encoding:utf-8
class PropertiesController < ApplicationController
  # before_filter :load_type_subject
  # before_filter :load_subject
  # before_filter :load_attr
  # respond_to :html
  # 
  # def new
  #   @property = Property.new
  # end
  # 
  # def edit
  #   @property = Property.find_by_subject_id(params[:subject_id])
  # end
  # 
  # def create
  #   @property = Property.new(params[:property])
  #   if @property.save
  #     flash[:notice] = "Доп. информация успешно сохранена"
  #     respond_with(@subject)
  #   else
  #     render 'new'
  #   end
  # end
  # 
  # def update
  #   @property = Property.find_by_subject_id(params[:subject_id])
  #   if @property.update_attributes(params[:property])
  #     flash[:notice] = "Доп. информация успешно обновлена"
  #     respond_with(@subject)
  #   else
  #     render 'edit'
  #   end
  # end
  # 
  # 
  # private
  #   
  #   def load_type_subject
  #     @subject = load_subject
  #     @typesubject = Typesubject.find(@subject.typesubject_id)
  #   end
  #   
  #   def load_subject
  #     @subject = Subject.find(params[:subject_id])
  #   end
  #   
  #   def load_attr
  #     typesubject = load_type_subject
  #     @attr = typesubject.find_values
  #   end
  #   
end
# todo: протестировать