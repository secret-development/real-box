# encoding:utf-8
require 'spec_helper'

describe PagesController do
  render_views
  
  before(:each) do
    controller.stub!(:all_deny)
  end
  
  describe "GET to root_path" do
    it "should success" do
      get :index
      response.should be_success
    end
    
    it "routes root_path" do
      { :get => "/" }.
      should route_to(:controller => "pages", :action => "index")
    end
    
    it "should have a non-blank body" do
      get :index
      response.body.should_not =~ /<body>\s*<\/body>/
    end
  end
  
  
end
