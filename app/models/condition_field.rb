# encoding:utf-8
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
  default_scope order("namefield ASC")
  
  def typefields
    {
      "выпадающий список" => "select",
      "радио кнопки" => "radio",
      "чекбоксы" => "checkbox",
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
    "#{typesubject.name} / #{namefield}"
  end
  
end

## == Schema Information
#
# Table name: condition_fields
#
#  id             :integer(4)      not null, primary key
#  namefield      :string(255)
#  created_at     :datetime        not null
#  updated_at     :datetime        not null
#  typefield      :string(255)
#  typesubject_id :integer(4)
#

