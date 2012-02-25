#encoding: UTF-8

class Transaction < ActiveRecord::Base
  
  attr_accessible :name, :description, :price, :payment, :user_id, :customer_id,
                  :typetransaction_id, :statustransaction_id, :subject_id
  
  belongs_to :typetransaction
  belongs_to :statustransaction
  belongs_to :customer
  belongs_to :subject
  belongs_to :user
  
  validates :name, 
            :presence => true,
            :length => { :maximum => 140 }
  validates :description, 
            :presence => true,
            :length => { :maximum => 800 }
  validates :user_id, :typetransaction_id, 
            :statustransaction_id, :customer_id,
            :presence => true
  validates :price, 
            :presence => true,
            :numericality => true
  
  validates_inclusion_of :payment, :in => [true, false]
  
  def payment_value
    payment == true ? "Оплачена" : "Не оплачена"
  end
  
  def button_value
    new_record? ? "Добавить" : "Обновить"
  end
  
  def legend
    new_record? ? "Добавление" : "Редактирование"
  end
  
  def self.search(search)
    if search
      where('name LIKE ?', "%#{search}%")
    else
      scoped
    end 
  end
      
end

#TODO: to add subject_id