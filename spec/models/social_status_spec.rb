# encoding: UTF-8
require 'spec_helper'

describe SocialStatus do
  before(:each) do
    @attr = {
      :title => "Семейные"
    }
  end
  it "should be create" do
    SocialStatus.create!(@attr)    
  end
  
  it "should respond to customer" do
    s = SocialStatus.new
    s.should respond_to(:customers)    
  end
  
  it "should have many customers" do
    s = SocialStatus.reflect_on_association(:customers)
    s.macro.should ==:has_many    
  end
end
