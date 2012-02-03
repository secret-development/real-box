# encoding: UTF-8
class TypeCustomer < ActiveRecord::Base
  has_many :customers, :dependent => :destroy
  validates :title, :presence => true, :uniqueness => true
  default_scope order('title ASC')
  def button_value
    if new_record?
      "Добавить"
    else
      "Редактировать"    
    end  
  end
end
