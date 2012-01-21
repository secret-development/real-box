# encoding: UTF-8
class Customer < ActiveRecord::Base
  validates :firstname, :lastname, :presence => true
  scope :real, where(:real => true)
end
