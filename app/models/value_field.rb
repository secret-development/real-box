# encoding:utf-8
class ValueField < ActiveRecord::Base
  validates :valuefield, :presence => true
  validates :condition_field_id, :presence => true
end
