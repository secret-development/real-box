# encoding: UTF-8
class SocialStatus < ActiveRecord::Base
  validates :title, :presence => true, :uniqueness => true
  has_many :customers, :dependent => :destroy
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
      "Добавление статуса"
    else 
      "Редактирование статуса"      
    end    
  end
end
# == Schema Information
#
# Table name: social_statuses
#
#  id         :integer(4)      not null, primary key
#  title      :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

