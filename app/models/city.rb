# encoding:utf-8
class City < ActiveRecord::Base
  # validates
  validates :name, :presence => true
  
  def button_value
    if new_record?
      "Добавить"
    else
      "Редактировать"
    end
  end
end
