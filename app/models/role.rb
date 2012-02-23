# encoding:utf-8
class Role < ActiveRecord::Base
  # association
  has_and_belongs_to_many :users
end
