#encoding:utf-8
require 'spec_helper'

describe Subject do
  before(:each) do
    @typesubjects = ["квартира", "комната", "коттедж", "дача", 
      "офис", "участок"]
      
    # valid data
    @attr = {
      :typesubject => @typesubjects[0],
      :cityname => "костанай",
      :township => "центр",
      :address => "абая 165, 119",
      :price => 70000,
      :numbofrooms => 3,
      :square => 72.0,
      :kitchensquare => 15.0,
      :livingsquare => 57.0,
      :floor => 7,
      :typestructure => "панельный",
      :yearofconstruction => 1950,
      :telephone => "yes",
      :furniture => "yes",
      :internet => "no",
      :balcony => "лоджия",
      :wc => "раздельный",
      :layout => "сталинка",
      :state => "отличное"
    }
    
  end
  
  describe "validates presence" do
    it "should create a new instance given a valid attribute" do
      @subject = Subject.create!(@attr)
    end

    it "should require a typesubject" do
      req_presence_sub(:typesubject).should_not be_valid
    end

    it "should require a cityname" do
      req_presence_sub(:cityname).should_not be_valid
    end

    it "should require a township" do
      req_presence_sub(:township).should_not be_valid
    end

    it "should require address" do
      req_presence_sub(:address).should_not be_valid
    end

    it "should require price" do
      req_presence_sub(:price).should_not be_valid
    end

    it "should require numbofrooms" do
      req_presence_sub(:numbofrooms).should_not be_valid
    end

    it "should require square" do
      req_presence_sub(:square).should_not be_valid
    end

    it "should require floor" do
      req_presence_sub(:floor).should_not be_valid
    end

    # Require presence subject(validates :presence => true)
    def req_presence_sub(par)
      @subejct = Subject.new(@attr.merge(par => ""))
    end
  end
  
  describe "other validations" do
    let(:subject) { Subject.new(@attr) }
    
    it "should include typesubjects" do
      subject.typesubject.should include @typesubjects[0]
    end
    
    it "price should include only integers" do
      subject.price.should be_kind_of(Integer)
    end
    
    it "numbofrooms should include only integers" do
      subject.numbofrooms.should be_kind_of(Integer)
    end
    
    it "floor should include only integers" do
      subject.floor.should be_kind_of(Integer)
    end
    
    it "year of construction include only integers" do
      subject.yearofconstruction.should be_kind_of(Integer)
    end
    
    it "square should numericality" do
      subject.square.should be_kind_of(Numeric)
    end
    
    it "kitchen square should numericality" do
      subject.kitchensquare.should be_kind_of(Numeric)
    end
    
    it "living square should numericality" do
      subject.livingsquare.should be_kind_of(Numeric)
    end    
  end
  
end
# == Schema Information
#
# Table name: subjects
#
#  id                 :integer(4)      not null, primary key
#  typesubject        :string(255)
#  cityname           :string(255)
#  township           :string(255)
#  address            :string(255)
#  price              :integer(4)
#  numbofrooms        :integer(4)
#  square             :float
#  kitchensquare      :float
#  livingsquare       :float
#  floor              :integer(4)
#  typestructure      :string(255)
#  yearofconstruction :integer(4)
#  telephone          :string(255)
#  furniture          :string(255)
#  internet           :string(255)
#  balcony            :string(255)
#  wc                 :string(255)
#  layout             :string(255)
#  state              :string(255)
#  created_at         :datetime        not null
#  updated_at         :datetime        not null
#

