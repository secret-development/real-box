# -*- encoding : utf-8 -*-
class Phone < ActiveRecord::Base
  # validations
  validates :customerphone, :presence => true
  validates :user_id, :presence => true
  # associations:
  belongs_to :customer
end
