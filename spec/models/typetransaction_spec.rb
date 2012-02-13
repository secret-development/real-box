# encoding:utf-8
require 'spec_helper'

describe Typetransaction do
  before(:each) do
    @typetransaction = Factory(:typetransaction)
    
    # valid data
    @attr = {
      :name => "Обмен"
    }
  end
  
  describe "associations" do
    describe "has_many :customers" do
      it "should respond_to customers" do
        @typetransaction = Typetransaction.new(@attr)
        @typetransaction.should respond_to(:customers)
      end
      
      it "should has_many :customers" do
        t = Typetransaction.reflect_on_association(:customers)
        t.macro.should == :has_many
      end
      
    end
  end
end
