# -*- encoding : utf-8 -*-
class Typetransaction < ActiveRecord::Base
  has_many :customers
  has_many :subjects
  has_many :transactions
end