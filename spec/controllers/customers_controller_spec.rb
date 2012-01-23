require 'spec_helper'

describe CustomersController do
  render_views

  describe "GET 'new'" do
    it "should be successful" do
      get :new
      response.should be_success
    end    
  end
  
  describe "GET #index" do
    subject {get :index}
    
    it {should render_template(:index)}
    
  end
  
  describe "GET #new" do
    subject {get :new}
    
    it {should render_template("new")}
    it {should render_template("new")}
    it {should render_template("customers/new")}    
  end
  
  describe "#create" do
    subject {post :create, :customer => {
      :firstname => "Ivan", 
      :lastname => "Ivanov", 
      :phonehome => "853049853",
      :phonemobile => "853049853"
    }}   
    
    it "redirect_to :action 'show'" do
      subject.should redirect_to :action => :show, :id => assigns(:customer).id      
    end    
  end
end

