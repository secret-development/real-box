# encoding: UTF-8
class Customer < ActiveRecord::Base
  # associations
  belongs_to :typetransaction
  belongs_to :social_status
  #validations
  validates :firstname, :lastname, :presence => true
  #scope
  scope :real, where(:real => false)
  scope :potentials, where(:real => true)
  default_scope order("lastname ASC")
  
  #permalink
#  def to_param
#    permalink    
#  end
  
  def button_value
    if new_record?
      "Добавить"
    else
      "Редактировать"      
    end    
  end
  
  def legend_value
    if new_record?
      "Добавление клиента"
    else 
      "Редактирование клиента"      
    end    
  end
end
# == Schema Information
#
# Table name: customers
#
#  id               :integer(4)      not null, primary key
#  firstname        :string(255)
#  lastname         :string(255)
#  phonehome        :string(255)
#  phonemobile      :string(255)
#  email            :string(255)
#  note             :text
#  created_at       :datetime        not null
#  updated_at       :datetime        not null
#  real             :boolean(1)      default(FALSE)
#  type_customer_id :integer(4)
#  social_status_id :integer(4)
#  permalink        :string(255)
#

