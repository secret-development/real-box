# encoding:utf-8

class Subject < ActiveRecord::Base
  # associations
  belongs_to :typesubject
  belongs_to :city
  
  # validations:
  validates :typesubject_id, :presence => true
  validates :city_id, :presence => true
  validates :price, :presence => true, :numericality => true
  
  def legend_value
    new_record? ? "Добавить объект" : "Редактировать объект"
  end
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

