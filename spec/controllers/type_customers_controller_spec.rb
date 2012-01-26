# encoding: UTF-8
require 'spec_helper'

describe TypeCustomersController do
  render_views
  
  before(:each) do
    @typecustomer = Factory(:type_customer)
  end
  
  it "GET 'index'" do
    get :index
    response.should be_success    
  end
  
  it "GET new" do
    get :new
    response.should be_success    
  end

end
