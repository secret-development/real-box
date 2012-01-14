# encoding:utf-8
require 'spec_helper'

describe PagesController do
  render_views
  
  before(:all) do
    @title = "Система: ReHandy"
  end
  
  describe "GET to root_path" do
    it "should success" do
      get :index
      response.should be_success
    end
    
    it "should have the right title" do
      get :index
      response.title.should =~ /@title/
    end
    
    it "should have a non-blank body" do
      get :index
      response.body.should_not =~ /<body>\s*<\/body>/
    end
  end
  
  
end
