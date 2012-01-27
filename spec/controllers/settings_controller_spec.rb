require 'spec_helper'

describe SettingsController do
  it "should be success" do
    get :index
    response.should be_success
  end
  
  it "routes to settings" do
    { :get => "/settings" }.
    should route_to(:controller => "settings", :action => "index")
  end
end
