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
# == Schema Information
#
# Table name: type_customers
#
#  id         :integer(4)      not null, primary key
#  title      :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

