# encoding: UTF-8
require 'spec_helper'

describe SocialStatusesController do
  render_views
  before(:each) do
    @socialstatus = Factory(:social_status)
  end
  
  it "GET 'new'" do
    get :new
    response.should be_success      
  end
  
  it "GET 'index'" do
    get :index
    response.should be_success
  end
  
  it "GET 'edit'" do
    get :edit, :id => @socialstatus.id
    response.should be_success    
  end
  
  describe "create" do
    before(:each) do
      @attr = { :title => "Семейный" }
    end
    it "should redirect to socialstatus index page" do
      post :create, :social_status => @attr
      response.should redirect_to(social_statuses_path)      
    end    
  end
  
end
