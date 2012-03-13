# -*- encoding : utf-8 -*-
require 'spec_helper'

describe HelpController do
  render_views
  
  before(:each) do
    # start auth
    @user = Factory(:user)
    test_log_in(@user)
    # end auth
  end
  
  it "get index" do
    get :index
    response.should be_success
  end
  
  it "get search" do
    get :search
    response.should be_success
  end
  
  it "get customers" do
    get :customers
    response.should be_success
  end
  
  it "get subjects" do
    get :subjects
    response.should be_success
  end
end
