# encoding: UTF-8
require 'spec_helper'

describe PotentialsController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

end
