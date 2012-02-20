# encoding:utf-8
class District < ActiveRecord::Base
  # associations:
  belongs_to :city

  # validations:
  validates :title, :uniqueness => {
    :scope => [:city_id],
    :case_sensitive => false
  }
  
  # scopes
  default_scope order("title ASC")
end
