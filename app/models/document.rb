#encoding: UTF-8

class Document < ActiveRecord::Base
  
  belongs_to :transaction
  mount_uploader :doc, DocumentUploader
  
end

#TODO: javascripts uploading documents <- handle this