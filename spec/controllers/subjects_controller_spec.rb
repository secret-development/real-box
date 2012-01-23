# encoding: UTF-8
require 'spec_helper'

describe SubjectsController do
  render_views
  
  describe "GET 'index'" do
    it "should be success" do
      get :index
      response.should be_success
    end
  end
end
