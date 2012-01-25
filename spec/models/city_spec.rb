# encoding: utf-8
require 'spec_helper'

describe City do
  before(:each) do
    @attr = {
      :name => "Костанай"
    }
  end
  
  describe "validates" do
    it "should create a new instance given a valid attrbiute" do
      @city = City.create!(@attr)
    end
    
    it "should require a name" do
      @city = City.new(@attr.merge(:name => "")).should_not be_valid
    end
  end
end
