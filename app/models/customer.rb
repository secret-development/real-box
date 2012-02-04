# encoding: UTF-8
class Customer < ActiveRecord::Base
  belongs_to :type_customer
  belongs_to :social_status
  validates :firstname, :lastname, :presence => true
  #validates :firstname, :lastname, :format => { :with => /^"([^"]*)"$/, :message => "Вводить только буквы!" }
  validates :phonehome, :phonemobile, :numericality => { :only_integer => true, :message => "Только целые числа!" }
  scope :real, where(:real => true)
  scope :potentials, where(:real => false)
  
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
# Table name: customers
#
#  id               :integer(4)      not null, primary key
#  firstname        :string(255)
#  lastname         :string(255)
#  phonehome        :string(255)
#  phonemobile      :string(255)
#  email            :string(255)
#  note             :text
#  created_at       :datetime
#  updated_at       :datetime
#  real             :boolean(1)      default(FALSE)
#  type_customer_id :integer(4)
#  social_status_id :integer(4)
#

