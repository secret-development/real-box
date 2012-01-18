# encoding: UTF-8
require 'spec_helper'

describe Customer do
  #pending "add some examples to (or delete) #{__FILE__}"
  before(:each) do
    @attr = {
      :firstname => "Ivan",
      :lastname => "Ivanov",
      :phonehome => "",
     # :real => true,
    }
  end
 # it "should create a new instance with valid attributes" do
 #   Customer.create!(@attr)    
 # end
  
  it "must be zero by default" do 
    @c = Customer.create(@attr)
    @c.real?().should be_false    
  end
end
