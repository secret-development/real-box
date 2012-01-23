#encoding: UTF-8
class Subject < ActiveRecord::Base
  
  # validates
  validates :typesubject, :cityname, :township, :address, :price, :numbofrooms,
    :square, :floor, :presence => true
  
end
