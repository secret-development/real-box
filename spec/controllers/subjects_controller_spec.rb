# encoding:utf-8
require 'spec_helper'

describe SubjectsController do
  render_views
  
  before(:each) do
    city = Factory(:city)
    typesubject = Factory(:typesubject)
    typetransaction = Factory(:typetransaction)
    @customer = Factory(:customer)
    @district = Factory(:district)
    @subject = Factory(:subject, :typesubject => typesubject, :city => city,
                :typetransaction => typetransaction, :customer => @customer, :district => @district)
  end
  
  it "get 'index'" do
    get :index
    response.should be_success
  end
  
  it "get new" do
    get :new
    response.should_not be_success
  end
  
  it "get new" do
    get :new, :customer_id => @customer
    response.should be_success
  end
  
  it "get edit" do
    get :edit, :id => @subject.id
    response.should be_success
  end
  
  it "get show" do
    get :show, :id => @subject.id
    response.should be_success
  end
  
  it "should have session[:customer_id]" do
    get :new, :customer_id => 3
    session[:customer_id].should eql("3")
  end
  
  describe "POST 'create'" do
    describe "failure" do
      before(:each) do
        @attr = invalid_data
        session[:customer_id] = @customer.id
      end
      
      it "should render the new page" do
        post :create, :subject => @attr 
        response.should render_template('new')
      end
      
      it "should not create a subject" do
        lambda do
          post :create, :subject => @attr
        end.should_not change(Subject, :count)
      end
    end
    
    describe "success" do
      before(:each) do
        @attr = valid_data
        session[:customer_id] = @customer.id
      end
      
      it "should redirect to show page" do
        post :create, :subject => @attr
        response.should redirect_to(subject_path(assigns(:subject)))
      end
      
      it "should create a subject" do
        lambda do
          post :create, :subject => @attr
        end.should change(Subject, :count).by(1)
      end
      
      it "should have a success message" do
        post :create, :subject => @attr
        flash[:notice].should =~ /Объект успешно создан/i
      end
    end
  end
  
  
  describe "PUT 'update'" do
    describe "failure" do
      before(:each) do
        @attr = invalid_data
      end
      
      it "should render the edit page" do
        put :update, :id => @subject, :subject => @attr
        response.should render_template('edit')
      end
      
      it "should not create a subject" do
        lambda do
          put :update, :id => @subject, :subject => @attr
        end.should_not change(Subject, :count)
      end
    end
    
    describe "success" do
      before(:each) do
        @attr = valid_data
      end
      
      it "should redirect to show page" do
        put :update, :id => @subject, :subject => @attr
        response.should redirect_to(subject_path(assigns(:subject)))
      end
      
      it "should not create a subject" do
        lambda do
          put :update, :id => @subject, :subject => @attr
        end.should_not change(Subject, :count)
      end
      
      it "should have success message" do
        put :update, :id => @subject, :subject => @attr
        flash[:notice].should =~ /Объект успешно обновлён/i
      end
    end
  end
  
  describe "destroy" do
    it "should redirect_to subjects list page" do
      delete :destroy, :id => @subject
      response.should redirect_to(subjects_path)
    end
    
    it "should destroy the subject" do
      lambda do
        delete :destroy, :id => @subject
      end.should change(Subject, :count).by(-1)
    end
    
    it "should have success message" do
      delete :destroy, :id => @subject
      flash[:notice].should =~ /Объект успешно удалён/i
    end
  end
  
  
  # valid data
  def valid_data
    {
      :typesubject_id => 1,
      :city_id => 2,
      :price => 100003,
      :district_id => @district.id,
      :area => 80,
      :address => "Баймагамбетова 15, 23",
      :customer_id => @customer
    }
  end
  
  # invalid data
  def invalid_data
    {
      :typesubject_id => 2,
      :city_id => nil,
      :price => "swsws",
      :district_id => @district.id,
      :area => 80,
      :address => "Баймагамбетова 15, 23",
      :customer_id => @customer
    }  
    
  end
  
end