# -*- encoding : utf-8 -*-
class City < ActiveRecord::Base
  
  # associations:
  has_many :subjects, :dependent => :destroy
  has_many :districts, :dependent => :destroy
  has_many :residents, :dependent => :destroy
  # validates
  validates :name, :presence => true,
            :uniqueness => { :case_sensitive => false}

  # scope
  default_scope order("name ASC")
            
  def legend_value
    if new_record?
      "Add city"
    else
      "Editing city"
    end
  end
  
  def button_value
    if new_record?
      "Add"
    else
      "Edit"
    end
  end
  
end
