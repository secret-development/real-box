# encoding:utf-8
require 'spec_helper'

describe Subject do
  before(:each) do
    @city = Factory(:city)
    @typesubject = Factory(:typesubject)
    @customer = Factory(:customer)
    @subject = Factory(:subject, :typesubject => @typesubject, :city => @city, 
        :customer => @customer)
    
    # valid attributes
    @attr = {
      :typesubject_id => 1,
      :city_id => 2,
      :customer_id => 2,
      :price => 100003,
      :area => 80,
      :address => "Баймагамбетова 15, 23"
    }
  end
  
  describe "validations" do
    it "should create new instance with valid attributes" do
      subject = Subject.create!(@attr)
    end
    
    it "should require the typesubject_id" do
      subject = Subject.new(@attr.merge(:typesubject_id => nil))
      subject.should_not be_valid
    end
    
    it "should require the city_id" do
      subject = Subject.new(@attr.merge(:city_id => nil))
      subject.should_not be_valid
    end
    
    it "should require the price" do
      subject = Subject.new(@attr.merge(:price => nil))
      subject.should_not be_valid
    end
    
    it "should price the numericality" do
      @attr[:price] = "dededeede"
      subject = Subject.new(@attr)
      subject.should_not be_valid
    end
    
    it "should require the customer_id" do
      @attr[:customer_id] = nil
      subject = Subject.new(@attr)
      subject.should_not be_valid
    end
  end
  
  describe "associations" do
    describe "typesubject" do
      it "should respond to typesubject" do
        subject = Subject.new(@attr)
        subject.should respond_to(:typesubject)
      end
      
      it "should belongs_to to typesubject" do
        s = Subject.reflect_on_association(:typesubject)
        s.macro.should == :belongs_to
      end
    end
    
    describe "city" do
      it "should respond to city" do
        subject = Subject.new(@attr)
        subject.should respond_to(:city)
      end
      
      it "should belongs_to to city" do
        subject = Subject.reflect_on_association(:city)
        subject.macro.should == :belongs_to
      end
    end
    
    describe "typetransaction" do
      it "should respond to typetransaction" do
        subject = Subject.new(@attr)
        subject.should respond_to(:typetransaction)
      end
      
      it "should belongs_to to typetransaction" do
        subject = Subject.reflect_on_association(:typetransaction)
        subject.macro.should == :belongs_to
      end
    end
    
    describe "customer" do
      it "should respond to customer" do
        subject = Subject.new(@attr)
        subject.should respond_to(:customer)
      end
      
      it "should belongs_to :customer" do
        subject = Subject.reflect_on_association(:customer)
        subject.macro.should == :belongs_to
      end
    end
  end
end# == Schema Information
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
#

