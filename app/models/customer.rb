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
