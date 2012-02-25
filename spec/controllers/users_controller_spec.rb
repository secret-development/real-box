require 'spec_helper'

describe UsersController do
  
  before(:each) do
    controller.stub!(:all_deny)
  end

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end
  end

end
