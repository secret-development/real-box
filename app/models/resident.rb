# -*- encoding : utf-8 -*-
class Resident < ActiveRecord::Base
  # associations:
  belongs_to :city
  has_many :subjects, :dependent => :nullify
  # validates
  validates :title, :presence => true
  validates :title, :uniqueness => {
    :scope => [:city_id],
    :case_sensitive => false
  }
  # scopes
  default_scope order("title ASC")
end
