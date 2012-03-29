# -*- encoding : utf-8 -*-
class ConditionField < ActiveRecord::Base
  
  # associations:
  has_many :value_fields, :dependent => :destroy
  belongs_to :typesubject
  
  # validations  
  validates :namefield, :presence => true
  validates :namefield, :uniqueness => { 
            :scope => [:typesubject_id], :case_sensitive => false }
  validates :typefield, :presence => true
  validates :typesubject_id, :presence => true

  # scopes:
  default_scope order("id ASC")
  
  scope :forform,  where("typefield != 'textfield' 
    and  typefield != 'textarea'").reorder("typesubject_id ASC")
  
  def typefields
    {
      "выпадающий список" => "select",
      "радио кнопки" => "radio",
      "текстовое поле" => "textfield",
      "большое текстовое поле" => "textarea" 
    }
  end
  
  def legend_value
    if new_record?
      "Добавить поле"
    else
      "Редактировать поле"
    end
  end

  def button_value
    if new_record?
      "Добавить"
    else
      "Редактировать"
    end
  end

  def namefield_with_typesubject
    "#{typesubject.name} → #{namefield}"
  end
  
end
