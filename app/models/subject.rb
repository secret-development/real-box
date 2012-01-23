#encoding: UTF-8
class Subject < ActiveRecord::Base
  
  # validates
  validates :typesubject, :cityname, :township, :address, :price, :numbofrooms,
    :square, :floor, :presence => true
  # only integers
  validates :price, :numbofrooms, :floor, :yearofconstruction, :numericality => 
    { :only_integer => true}
  # square
  validates :square, :kitchensquare, :livingsquare, :numericality => true
  
end
