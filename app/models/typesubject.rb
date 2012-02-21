# encoding:utf-8
class Typesubject < ActiveRecord::Base
  
  # associations:
  has_many :condition_fields, :dependent => :destroy
  has_many :subjects, :dependent => :nullify
  
  # validates
  validates :name, :presence => true, 
            :uniqueness => { :case_sensitive => false }
  validates :permalink, :presence => true, 
            :uniqueness => { :case_sensitive => false }
  validates :floor, :inclusion => { :in => [true, false]}
  
  default_scope order("name ASC")
  
  def legend_value
    new_record? ? "Добавить тип недвижимости" : "Редактировать тип недвижимости"
  end
  
  def button_value
    new_record? ? "Добавить" : "Редактировать"
  end
end

# == Schema Information
#
# Table name: typesubjects
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  permalink  :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#  floor      :boolean(1)
#