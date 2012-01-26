# encoding: UTF-8
require 'spec_helper'

describe TypeCustomer do
  before(:each) do
    @attr = { :title => "Продавец" }
  end
  
  it "should be create" do
    TypeCustomer.create!(@attr)    
  end
end
