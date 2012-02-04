#encoding: UTF-8
class Subject < ActiveRecord::Base
  
  # validates
  validates :typesubject, :cityname, :township, :address, :price, :numbofrooms,
    :square, :floor, :presence => true
  # only integers
  validates :price, :numbofrooms, :floor, :yearofconstruction, :numericality => 
    { :only_integer => true}
  # square
  validates :square, :kitchensquare, :livingsquare, :numericality => true
  
  def button_value
    if new_record?
      "Добавить"
    else
      "Редактировать"
    end
  end
  
end

# TODO: переделать модель: миграции, сделать основные поля и связать с доп.полями# == Schema Information
#
# Table name: subjects
#
#  id                 :integer(4)      not null, primary key
#  typesubject        :string(255)
#  cityname           :string(255)
#  township           :string(255)
#  address            :string(255)
#  price              :integer(4)
#  numbofrooms        :integer(4)
#  square             :float
#  kitchensquare      :float
#  livingsquare       :float
#  floor              :integer(4)
#  typestructure      :string(255)
#  yearofconstruction :integer(4)
#  telephone          :string(255)
#  furniture          :string(255)
#  internet           :string(255)
#  balcony            :string(255)
#  wc                 :string(255)
#  layout             :string(255)
#  state              :string(255)
#  created_at         :datetime        not null
#  updated_at         :datetime        not null
#

