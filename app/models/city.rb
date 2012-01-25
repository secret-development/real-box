# encoding:utf-8
class City < ActiveRecord::Base
  # validates
  validates :name, :presence => true
end
