# encoding: UTF-8
class Customer < ActiveRecord::Base
  validates :firstname, :lastname, :presence => true
end
