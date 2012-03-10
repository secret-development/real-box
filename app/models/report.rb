# -*- encoding : utf-8 -*-
class Report < ActiveRecord::Base
  def self.total_on(date)
    Transaction.where("date(created_at) = ? AND price_currency = ?", date, "доллар").sum(:price)    
  end
  
  def self.total_month(month)
    Transaction.where("month(created_at) = ?", month).sum(:price)    
  end
  
  def self.total
    Transaction.sum(:price)    
  end
  
  def self.sum_month(m)
    Transaction.where("m(created_at) = ?", m).sum(:price)    
  end
  
end
# transaction
#    t.string   "name"
#    t.text     "description"
#    t.integer  "customer_id"
#    t.integer  "user_id"
#    t.integer  "typetransaction_id"
#    t.integer  "subject_id"
#    t.integer  "price"
#    t.boolean  "payment"
#    t.datetime "created_at",         :null => false
#    t.datetime "updated_at",         :null => false
#    t.boolean  "admin"
#    t.string   "price_currency"
