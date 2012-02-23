#encoding: UTF-8

require 'spec_helper'

describe Statustransaction do
  
  before(:each) do
    @statustransaction = Factory(:statustransaction)
    
    @attr = {
      :name => "Активна"
    }
  end
  
  describe "transactions associations" do
    
    it "should respond_to transactions" do
      @statustransaction = Statustransaction.new(@attr)
      @statustransaction.should respond_to(:transactions)
    end
    
    it "should has_many :transactions" do
      s = Statustransaction.reflect_on_association(:transactions)
      s.macro.should == :has_many
    end
    
  end
  
end
