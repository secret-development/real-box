# encoding: UTF-8
class Customer < ActiveRecord::Base
  validates :firstname, :lastname, :presence => true
  
  def convert(real)
    if @customer.real ==true
      real = "Да"
    else 
      real = "Нет"
    end       
  end
end
