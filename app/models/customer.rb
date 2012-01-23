# encoding: UTF-8
class Customer < ActiveRecord::Base
  validates :firstname, :lastname, :presence => true
  #validates :firstname, :lastname, :format => { :with => /^"([^"]*)"$/, :message => "Вводить только буквы!" }
  validates :phonehome, :phonemobile, :numericality => { :only_integer => true, :message => "Только целые числа!" }
  scope :real, where(:real => true)
end
