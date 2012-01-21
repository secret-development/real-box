#encoding:utf-8
require 'spec_helper'

describe Subject do
  before(:each) do
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
end
