# encoding:utf-8
require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the PagesHelper. For example:
#
# describe PagesHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       helper.concat_strings("this","that").should == "this that"
#     end
#   end
# end
describe PagesHelper do
  
  before(:all) do
    @default_title = "Система: ReHandy"
  end
  
  describe "#title" do
    it "return the default page" do
      helper.title.should eql("#{@default_title}")
    end
  end
end
