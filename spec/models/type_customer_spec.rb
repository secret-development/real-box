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
end
