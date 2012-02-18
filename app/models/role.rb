# encoding:utf-8
class Role < ActiveRecord::Base
  # associations:
  has_and_belongs_to_many :users
end
