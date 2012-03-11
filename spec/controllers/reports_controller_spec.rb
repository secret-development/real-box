require 'spec_helper'

describe ReportsController do
  before(:each) do
    @user = Factory(:user)
    test_log_in(@user)
  end
  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

end
