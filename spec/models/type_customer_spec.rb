# encoding: UTF-8
require 'spec_helper'

describe TypeCustomer do

  before(:each) do
    @attr = { :title => "Продавец" }
  end
  
  it "should be create" do
    TypeCustomer.create!(@attr)    
  end
  
  it "should respond to customer" do
    t = TypeCustomer.new
    t.should respond_to(:customers)    
  end
  
  it "should have many customers" do
    t = TypeCustomer.reflect_on_association(:customers)
    t.macro.should ==:has_many    
  end
  
  it "validation uniqueness" do
    TypeCustomer.create!(@attr)
    old_title = TypeCustomer.new(@attr)
    old_title.should_not be_valid        
  end
  
  it "validation uniqueness case sensetive" do
    TypeCustomer.create!(@attr)
    old_title = TypeCustomer.new(@attr.merge(:title => @attr[:title].upcase))
    old_title.should_not be_valid     
  end
end
# == Schema Information
#
# Table name: type_customers
#
#  id         :integer(4)      not null, primary key
#  title      :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

