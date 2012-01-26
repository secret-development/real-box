# encoding:utf-8
class ConditionField < ActiveRecord::Base
  validates :namefield, :presence => true
  validates :typefield, :presence => true
  
  def typefields
    {
      "select" => "выпадающий список",
      "radio"  => "радио кнопки",
      "checkbox" => "чекбоксы",
      "textfield" => "текстовое поле",
      "textarea" => "большое текстовое поле"
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
