# encoding:utf-8
class City < ActiveRecord::Base
  
  # associations:
  has_many :subjects, :dependent => :nullify
  has_many :districts, :dependent => :destroy
  # validates
  validates :name, :presence => true,
            :uniqueness => { :case_sensitive => false}

  # scope
  default_scope order("name ASC")
            
  def legend_value
    if new_record?
      "Добавить город"
    else
      "Редактировать город"
    end
  end
  
  
  def button_value
    if new_record?
      "Добавить"
    else
      "Редактировать"
    end
  end
  
end

# == Schema Information
#
# Table name: cities
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#