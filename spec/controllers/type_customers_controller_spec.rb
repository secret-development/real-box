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
  
  it "GET 'edit'" do
    get :edit, :id => @typecustomer.id
    response.should be_success
  end
  
  describe "POST create failture" do
    before(:each) do
      @attr = {:title => ""}
    end
    
    it "should not create" do
      lambda do
        post :create, :type_customer => @attr
      end.should_not change(TypeCustomer, :count)
    end    
  end
  
  describe "POST create successful" do
    before(:each) do
      @attr = {:title => "Арендатор"}
    end
    
    it "should create successful" do
      lambda do
        post :create, :type_customer => @attr
      end.should change(TypeCustomer, :count).by(1)
    end
    
    it "should have a successful message" do
      post :create, :type_customer => @attr
      flash[:notice].should =~ /Тип клиента добавлен!/i
    end
    
    it "should redirect_to index page" do
      post :create, :type_customer => @attr
      response.should redirect_to(type_customer_path)
    end
  end
  
  describe "Update successful" do
    before(:each) do
      @attr ={:title => "Продавец"}
    end
    
    it " should be update" do
      lambda do
        put :update, :id => @typecustomer.id, :type_customer => @attr
      end.should_not change(TypeCustomer, :count) 
    end
    
    it "should be redirect index page" do
      put :update, :id => @typecustomer.id, :type_customer => @attr
      response.should redirect_to(type_customers_path)
    end
    
    it "should have a successful message" do
      put :update, :id => @typecustomer.id, :type_customer => @attr
      flash[:notice].should =~ /Тип клиента обновлен!/i      
    end
  end
  
  describe "DELETE successful" do
    it "should be destroy" do
      lambda do
        delete :destroy, :id => @typecustomer.id
      end.should change(TypeCustomer, :count).by(-1)
    end
    
    it "should have a successful message" do
      delete :destroy, :id => @typecustomer.id
      flash[:notice].should =~ /Тип клиента удален!/i   
    end
    
    it "should redirect to index page" do
      delete :destroy, :id => @typecustomer.id
      response.should redirect_to(type_customers_path)
    end
    
  end

end
