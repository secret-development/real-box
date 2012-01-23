# encoding: UTF-8
class Customer < ActiveRecord::Base
  validates :firstname, :lastname, :presence => true
  validates :phonehome, :phonemobile, :numericality => { :only_integer => true }
  scope :real, where(:real => true)
end
