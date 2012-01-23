# encoding: UTF-8
require 'spec_helper'

describe SubjectsController do
  render_views

  before(:each) do
    @subject = Factory(:subject)
  end
  
  it "should be success(index)" do
    get :index
    response.should be_success
  end

  it "should be succes(show)" do
    get :show, :id => @subject
    response.should be_success
  end
  
end
