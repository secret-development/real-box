# encoding: UTF-8
require 'spec_helper'

describe PotentialsController do

  before(:each) do
    controller.stub!(:all_deny)
  end

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

end
