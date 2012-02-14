# encoding:utf-8
require 'spec_helper'

describe Subject do
  before(:each) do
    @city = Factory(:city)
    @typesubject = Factory(:typesubject)
    @subject = Factory(:subject, :typesubject => @typesubject, :city => @city)
    
    # valid attributes
    @attr = {
      :typesubject_id => 1,
      :city_id => 2,
      :price => 100003,
      :area => 80,
      :address => "Баймагамбетова 15, 23"
    }
  end
  
  describe "validations" do
    
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

