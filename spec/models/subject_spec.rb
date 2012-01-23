#encoding:utf-8
require 'spec_helper'

describe Subject do
  before(:each) do
    # valid data
    @attr = {
      :typesubject => "квартира",
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
