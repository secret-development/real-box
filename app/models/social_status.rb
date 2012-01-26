# encoding: UTF-8
class SocialStatus < ActiveRecord::Base
  has_many :customers
  def button_value
    if new_record?
      "Добавить"
    else
      "Редактировать"    
    end  
  end
end
