#encoding: utf-8

require 'spec_helper'

describe Typesubject do
  
  before(:each) do
    @typesubject = Factory(:typesubject)
    
    # valid data
    @attr = {
      :name => "Дача",
      :permalink => "dacha",
      :floor => true
    }
  end
  
  describe "validates" do
    it "should create a new instance given a valid attributes" do
      Typesubject.create!(@attr)
    end
    
    it "should require name" do
      @attr[:name] = nil
      @typesubject = Typesubject.new(@attr)
      @typesubject.should_not be_valid
    end
    
    it "should require permalink" do
      @attr[:permalink] = nil
      @typesubject = Typesubject.new(@attr)
      @typesubject.should_not be_valid
    end
    
    it "should require floor" do
      @attr[:floor] = nil
      @typesubject = Typesubject.new(@attr)
      @typesubject.should_not be_valid
    end
    
    it "should reject duplicate name" do
      Typesubject.create!(@attr)
      typesubject_with_duplicate = 
      Typesubject.new(@attr.merge(:permalink => "cottedg"))
      typesubject_with_duplicate.should_not be_valid
    end
    
    it "should reject duplicate permalink" do
      Typesubject.create!(@attr)
      typesubject_with_duplicate = 
      Typesubject.new(@attr.merge(:name => "Дом"))
      typesubject_with_duplicate.should_not be_valid
    end
    
    it "should reject duplicate name(case sensitive)" do
      Typesubject.create!(@attr)
      typesubject = 
      Typesubject.new(@attr.merge(:name => @attr[:name].downcase, :permalink => "sss"))
      typesubject.should_not be_valid
    end
    
    it "should reject duplicate permalink(case sensitive)" do
      Typesubject.create!(@attr)
      typesubject = 
      Typesubject.new(@attr.merge(:name => "сад", :permalink => @attr[:permalink].upcase))
      typesubject.should_not be_valid
    end
    
    it "should floor contain false or true" do
      @typesubject = Typesubject.new(@attr)
      [true, false].should include(@typesubject.floor)
    end
    
  end
  
  
  describe "associations" do
    
    describe "has_many :condition_fields" do
      it "should respond_to condition_fields" do
        @typesubject = Typesubject.new(@attr)
        @typesubject.should respond_to(:condition_fields)
      end
      
      it "should has_many condition_fields" do
        t = Typesubject.reflect_on_association(:condition_fields)
        t.macro.should == :has_many
      end
      
      it "should dependent destroy" do
        t = Typesubject.reflect_on_association(:condition_fields)
        t.options[:dependent].should == :destroy
      end
    end
    
    describe "has_many :subjects" do
      it "should respond_to :subjects" do
        @typesubject = Typesubject.new(@attr)
        @typesubject.should respond_to(:subjects)
      end
      
      it "should has_many :subjects" do
        t = Typesubject.reflect_on_association(:subjects)
        t.macro.should == :has_many
      end
      
      it "should dependent nullify" do
        t = Typesubject.reflect_on_association(:subjects)
        t.options[:dependent].should == :nullify
      end
    end
  end
  
end

# == Schema Information
#
# Table name: typesubjects
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  permalink  :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#  floor      :boolean(1)
## == Schema Information
#
# Table name: typesubjects
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  permalink  :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#  floor      :boolean(1)
#

