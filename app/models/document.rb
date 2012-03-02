#encoding: UTF-8

class Document < ActiveRecord::Base
  
  belongs_to :transaction
  
end
