# encoding:utf-8
class Property < ActiveRecord::Base
  # validations
  validates :subject_id, :presence => true
  # validates :condition, :presence => true
  # validates :value, :presence => true
  
  # associations
  belongs_to :subject
  
  attr_accessible :subject_id, :condition, :value, :typefield
  
  
  # def legend_value
  #   new_record? ? "Добавить доп.информацию" : "Редактировать доп.информацию"
  # end
  # 
  # def button_value
  #   new_record? ? "Добавить" : "Редактировать"
  # end
end
