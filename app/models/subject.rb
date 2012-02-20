# encoding:utf-8

class Subject < ActiveRecord::Base
  
  # associations
  belongs_to :typesubject
  belongs_to :city
  belongs_to :typetransaction
  belongs_to :customer
  belongs_to :district
  # callbacks:
  after_save :verify_customer_real
  after_update :verify_customer_real
  after_destroy :verify_customer_real
  
  # validations:
  validates :typesubject_id, :presence => true
  validates :city_id, :presence => true
  validates :price, :presence => true, :numericality => true
  validates :customer_id, :presence => true
  # validates :district_id, :presence => true
  validates :districtname, :presence => true
  
  def legend_value
    new_record? ? "Добавить объект" : "Редактировать объект"
  end
  
  def button_value
    new_record? ? "Добавить" : "Редактировать"
  end
  
  
  def verify_customer_real
    cust = Customer.find(customer_id)
    if cust.subjects.count > 0  
      cust.update_attributes(:potentials => false)
    else
      cust.update_attributes(:potentials => true)
    end
  end
  
  def districtname=(title)
    d = District.create(:title => title, :city_id => city_id)
    self.district_id = d.id
  end
  
  def districtname
    unless district_id.nil?
      d = District.find(district_id)
      d.title
    end
  end
  
  
end

# == Schema Information
#
# Table name: subjects
#
#  id             :integer(4)      not null, primary key
#  typesubject_id :integer(4)
#  city_id        :integer(4)
#  price          :integer(4)
#  area           :integer(4)
#  address        :string(255)
#  created_at     :datetime        not null
#  updated_at     :datetime        not null