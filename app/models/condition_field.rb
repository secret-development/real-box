# encoding:utf-8
class ConditionField < ActiveRecord::Base
  validates :namefield, :presence => true
  validates :typefield, :presence => true
  
  def typefields
    {
      "выпадающий список" => "select",
      "радио кнопки" => "radio",
      "чекбоксы" => "checkbox",
      "текстовое поле" => "textfield",
      "большое текстовое поле" => "textarea" 
    }
  end
  
  def button_value
    if new_record?
      "Добавить"
    else
      "Редактировать"
    end
  end
  
end
