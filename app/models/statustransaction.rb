#encoding: UTF-8

class Statustransaction < ActiveRecord::Base
  
  attr_accessible :name
  has_many :transactions
end
