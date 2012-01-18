# encoding: UTF-8
require 'spec_helper'

describe Customer do
  #pending "add some examples to (or delete) #{__FILE__}"
  before(:each) do
    @attr = {
      :firstname => "Ivan",
      :lastname => "Ivanov",
      :phonehome => ""
    }
  end
  it "should create a new instance with valid attributes" do
    Customer.create!(@attr)    
  end
end
