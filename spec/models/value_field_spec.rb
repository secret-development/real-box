# encoding:utf-8
require 'spec_helper'

describe ValueField do
  before(:each) do
    @valuefield = Factory(:value_field)
    @attr = {
      :valuefield => "Нет",
      :condition_field_id => 1
    }
  end
  
  describe "validations" do
    it "should create a new instance given a valid attribute" do
      @valuefield = ValueField.create!(@attr)
    end
    
    it "should require a valuefield" do
      @valuefield = ValueField.new(@attr.merge(:valuefield => ""))
      @valuefield.should_not be_valid
    end
    
    it "should require a condition_field_id" do
      @valuefield = ValueField.new(@attr.merge(:condition_field_id => ""))
      @valuefield.should_not be_valid
    end    
  end
  
  describe "associations" do
    it "should respond to condition_field" do
      v = ValueField.new(@attr)
      v.should respond_to(:condition_field)
    end
    
    it "should belongs to condition_field" do
      v = ValueField.reflect_on_association(:condition_field)
      v.macro.should == :belongs_to
    end
    
  end
end