# encoding: UTF-8
class TypeCustomer < ActiveRecord::Base
  #associations
  has_many :customers, :dependent => :destroy
  #validates
  validates :title, :presence => true, :uniqueness => true
  #scope
  default_scope order('title ASC')
  
  def button_value
    if new_record?
      "Добавить"
    else
      "Редактировать"    
    end  
  end
  
  def legend_value
    if new_record?
      "Добавление типа клиента"
    else
      "Редактирование типа клиента"      
    end    
  end
  
  def self.asctitle
    order("title ASC")    
  end
end
# == Schema Information
#
# Table name: type_customers
#
#  id         :integer(4)      not null, primary key
#  title      :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

