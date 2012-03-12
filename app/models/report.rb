# -*- encoding : utf-8 -*-
class Report < ActiveRecord::Base
  # finance report
  def self.total_dollar(date)
    Transaction.where("date(created_at) = ? AND price_currency = ?", date, "доллар").sum(:price)    
  end
  
  def self.total_ru(date)
    Transaction.where("date(created_at) = ? AND price_currency = ?", date, "рубль").sum(:price)    
  end
  
  def self.total_euro(date)
    Transaction.where("date(created_at) = ? AND price_currency = ?", date, "евро").sum(:price)    
  end
  
  def self.total_tg(date)
    Transaction.where("date(created_at) = ? AND price_currency = ?", date, "тенге").sum(:price)    
  end
  
  # activ users report
  def self.find_user(user)
    @u = User.find(user) 
  end
  
  def self.return_name
    @u.fullname    
  end
  
  def self.activ_user(date)
    cust = @u.customers.where("date(created_at) = ?", date).count(:id)
    sub = @u.subjects.where("date(created_at) = ?", date).count(:id)
    tran = @u.transactions.where("date(created_at) = ?", date).count(:id)
    summa = (cust + sub + tran)/3.0
    return summa.to_f.round(3)
  end
#  def self.activ_user_cust(date)
#    @u.customers.where("date(created_at) = ?", date).count(:id)        
#  end
#  
#  def self.activ_user_sub(date)
#    @u.subjects.where("date(created_at) = ?", date).count(:id)    
#  end
#  
#  def self.activ_user_tran(date)
#    @u.transactions.where("date(created_at) = ?", date).count(:id)    
#  end
     
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
