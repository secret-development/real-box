# encoding:utf-8
class ValueField < ActiveRecord::Base
  # associations:
  belongs_to :condition_field
  
  # validations:
  validates :valuefield, :presence => true
  validates :condition_field_id, :presence => true
end
