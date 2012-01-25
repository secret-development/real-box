# encoding: UTF-8
require 'spec_helper'

describe Customer do
  #pending "add some examples to (or delete) #{__FILE__}"
  before(:each) do
    @attr = {
      :firstname => "Ivan",
      :lastname => "Ivanov",
      :phonehome => "839321",
      :phonemobile => "87771234567",
     # :real => true,
    }
  end
  it "should create a new instance with valid attributes" do
    Customer.create!(@attr)    
  end
  
  it "must be zero by default and save attributes" do 
    @c = Customer.create(@attr)
    @c.real?().should be_false
    @c.save.should eq(true)    
  end
<<<<<<< HEAD
  
  it "update" do
    @cust = Customer.create!(@attr)
    Customer = @cust.id
    Customer = {:firstname => "Vanya"}   
  end
end
=======
end
>>>>>>> aleksandr
