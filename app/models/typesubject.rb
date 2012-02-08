# encoding:utf-8
class Typesubject < ActiveRecord::Base
  
  # associations:
  has_many :condition_fields, :dependent => :destroy
  
  # validates
  validates :name, :presence => true, :uniqueness => true
  validates :permalink, :presence => true, :uniqueness => true
end
