# encoding: UTF-8
class Rcustomer < ActiveRecord::Base
  validates :firstname, :lastname, :presence => true
end
