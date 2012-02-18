# encoding:utf-8
require 'spec_helper'

describe District do
  before(:each) do
    @city = Factory(:city)
    @district = Factory(:district, :city => @city)
    @attr = {
      :city_id => 1,
      :title => "КЖБИ"
    }
  end
  
  it "should create with valid data" do
    district = District.create!(@attr)
  end
  
  describe "associations" do
    it "should respond_to city" do
      district = District.new(@attr)
      district.should respond_to(:city)
    end
    
    it "should belongs_to :city" do
      district = District.reflect_on_association(:city)
      district.macro.should == :belongs_to
    end
  end
end
