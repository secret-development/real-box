# encoding:utf-8
class Property < ActiveRecord::Base
  # validations
  validates :subject_id, :presence => true
  validates :condition, :presence => true
  validates :value, :presence => true
  
  # associations
  belongs_to :subject
  
  attr_accessible :condition, :value, :subject_id
end
