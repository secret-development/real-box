#encoding: UTF-8
class User < ActiveRecord::Base
  
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  validates :adress, :phone, :birth_date, 
            :presence => true
  
  validates :first_name, :last_name, :middle_name,
            :presence => true,
            :length => { :maximum => 50 }
            
  validates :email, :presence   => true,
            :format     => { :with => email_regex },
            :uniqueness => { :case_sensitive => false }
            
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
# Table name: users
#
#  id          :integer(4)      not null, primary key
#  email       :string(255)
#  last_name   :string(255)
#  first_name  :string(255)
#  middle_name :string(255)
#  birth_date  :date
#  adress      :string(255)
#  phone       :string(255)
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#

