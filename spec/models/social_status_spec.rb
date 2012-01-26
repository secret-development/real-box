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
end
