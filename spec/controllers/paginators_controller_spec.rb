# -*- encoding : utf-8 -*-
require 'spec_helper'

describe PaginatorsController do
  render_views
  
  before(:each) do
    # start auth
    @user = Factory(:user)
    test_log_in(@user)
    # end auth
    
    @paginator = Factory(:paginator)
  end
  
  it "get index" do
    get :index
    response.should be_success
  end
  
  it "get edit" do
    get :edit, :id => @paginator
    response.should be_success
  end
  
  describe "update" do
    describe "failure" do
      
    end
    
    describe "success" do
      
    end
  end

end
