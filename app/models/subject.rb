# encoding:utf-8
class Subject < ActiveRecord::Base
  belongs_to :typesubject
  belongs_to :city
end
