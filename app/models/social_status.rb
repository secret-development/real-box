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
end
