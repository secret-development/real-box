class District < ActiveRecord::Base
  # associations:
  belongs_to :city
  
  # scopes
  default_scope order("title ASC")
end
