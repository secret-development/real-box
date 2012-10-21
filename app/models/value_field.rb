# -*- encoding : utf-8 -*-
class ValueField < ActiveRecord::Base
  # associations:
  belongs_to :condition_field
  
  # validations:
  validates :valuefield, :presence => true
  validates :condition_field_id, :presence => true
  validates :valuefield, :uniqueness => {
    :scope => [:condition_field_id],
    :case_sensitive => false
  }
  
  def legend_value
    new_record? ? "Adding value" : "Editing value"
  end
  
  def button_value
    new_record? ? "Add" : "Edit"
  end

  
end

# == Schema Information
#
# Table name: value_fields
#
#  id                 :integer(4)      not null, primary key
#  valuefield         :string(255)
#  condition_field_id :integer(4)
#  created_at         :datetime        not null
#  updated_at         :datetime        not null
#

