# encoding: UTF-8
require 'spec_helper'

describe Customer do

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
  
  
  it "should respond to social_status" do
    s = Customer.new
    s.should respond_to(:social_status)    
  end
  
  it "should have one status" do
    t = Customer.reflect_on_association(:social_status)
    t.macro.should ==:belongs_to
  end
  
  
  
  describe "associations" do
    it "should respond to typetransaction" do
      c = Customer.new(@attr)
      c.should respond_to(:typetransaction)
    end
    
    it "shouild belongs_to to typetransaction" do
      c = Customer.reflect_on_association(:typetransaction)
      c.macro.should == :belongs_to
    end
  end
  
end


# == Schema Information
#
# Table name: customers
#
#  id                 :integer(4)      not null, primary key
#  firstname          :string(255)
#  lastname           :string(255)
#  phonehome          :string(255)
#  phonemobile        :string(255)
#  email              :string(255)
#  note               :text
#  created_at         :datetime
#  updated_at         :datetime
#  real               :boolean(1)      default(FALSE)
#  social_status_id   :integer(4)
#  permalink          :string(255)
#  typetransaction_id :integer(4)
#

