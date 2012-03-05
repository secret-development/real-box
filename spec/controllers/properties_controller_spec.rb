# encoding:utf-8
require 'spec_helper'

describe PropertiesController do
  render_views
  
  before(:each) do
    # start auth
    @user = Factory(:user)
    test_log_in(@user)
    # end auth
    @city = Factory(:city)
    @typesubject = Factory(:typesubject)
    @district = Factory(:district)
    @customer = Factory(:customer)
    @subject = Factory(:subject, :typesubject => @typesubject, :city => @city, 
        :customer => @customer, :district => @district)

    @property = Factory(:property, :subject => @subject)
  end
  
  # it "get new" do
  #     get :new, :subject_id => @subject
  #     response.should be_success
  #   end
  #   
  #   it "get edit" do
  #     get :edit, :subject_id => @subject, :id => @property.id
  #     response.should be_success
  #   end
    
end
