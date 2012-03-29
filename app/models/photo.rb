# -*- encoding : utf-8 -*-
class Photo < ActiveRecord::Base
  belongs_to :subject
  mount_uploader :image, PhotoUploader
end