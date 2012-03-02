#encoding: UTF-8

class Transaction < ActiveRecord::Base
  
  #associations
  belongs_to :user
  belongs_to :customer
  belongs_to :subject
  belongs_to :typetransaction
  
  #validations
  validates :user_id, :customer_id, :typetransaction_id,
            :presence => true
  validates :name,
            :presence => true,
            :length => { :maximum => 140 }
  validates :description,
            :presence => true,
            :length => { :maximum => 800 }
  validates :price,
            :presence => true,
            :numericality => true          
  validates_inclusion_of :payment, :in => [true, false]
  
  #methods
  def payment_value
    payment == true ? "Сделка оплачена" : "Сделка не оплачена"
  end
  
  def legend
    new_record? ? "Добавление" : "Редактирование"
  end
  
  def button_value
    new_record? ? "Добавить" : "Обновить"
  end
  
  def self.search(search)
    if search
      where('name LIKE ?', "%#{search}%") 
    else
      scoped
    end
  end
  
end