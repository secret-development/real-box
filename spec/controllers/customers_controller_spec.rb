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
    subject {post :create, :customer => {:firstname => "Ivan", :lastname => "Ivanov"}}
    
    it "redirects_to customer_url(@customer)" do
      subject.should redirect_to(customers_url(assigns(:customers)))      
    end
    it "redirect_to :action 'index'" do
      subject.should redirect_to :action => :index   #:action => :show, :id => assigns(:customer).id если редирект на экшн show     
    end    
  end
  
  describe "#update" do
    before(:each) do
      @attr = {
        :firstname => "Vova",
        :lastname => "Vovanov"
      }
    end
    #subject {post :update, :customer => {:update_attributes => true}}#:firstname => "Uri", :lastname => "Urev"}}
    @c = Customer.create!(@attr)
    @c.save.should eq(true)
    #@c.firstname = "Vov"
    #@c.lastname ="w"
    it "redirect_to :action 'show'" do
      @c.update_attributes.should be_false
      #subject.should redirect_to :action => :show, :id => assigns(:customer).id      
    end
    
   
    
  end
  

end

