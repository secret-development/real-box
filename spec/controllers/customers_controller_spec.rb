require 'spec_helper'

describe CustomersController do
  render_views

  describe "GET 'new'" do
    it "should be successful" do
      get :new
      response.should be_success
    end    
  end
  
  describe "" do
    
  end
end

