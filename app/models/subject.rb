# encoding:utf-8
class Subject < ActiveRecord::Base
  belongs_to :typesubject
  belongs_to :city
end
# == Schema Information
#
# Table name: subjects
#
#  id             :integer(4)      not null, primary key
#  typesubject_id :integer(4)
#  city_id        :integer(4)
#  price          :integer(4)
#  area           :integer(4)
#  address        :string(255)
#  created_at     :datetime        not null
#  updated_at     :datetime        not null
#

