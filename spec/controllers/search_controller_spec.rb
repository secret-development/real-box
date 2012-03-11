# -*- encoding : utf-8 -*-
require 'spec_helper'

describe SearchController do
  render_views
  
  it "GET index should be success" do
    get :index
    response.should be_success
  end
end
