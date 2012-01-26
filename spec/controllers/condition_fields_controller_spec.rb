# encoding:utf-8
require 'spec_helper'

describe ConditionFieldsController do
  render_views
  
  before(:each) do
    @conditionfield = Factory(:condition_field)
  end
  
  it "get index" do
    get :index
    response.should be_success
  end
  
  it "get new" do
    get :new
    response.should be_success
  end
  
  it "get edit" do
    get :edit, :id => @conditionfield.id
  end
  
  describe "POST 'create'" do
    describe "failure" do
      before(:each) do
        @attr = invalid_data
      end
      
      it "should render the 'new' page" do
        post :create, :condition_field => @attr
        response.should render_template('new')
      end
      
      it "should not create a condition_field" do
        lambda do
          post :create, :condition_field => @attr  
        end.should_not change(ConditionField, :count)
      end
      
    end
    
    describe "success" do
      before(:each) do
        @attr = valid_data
      end
      
      it "should redirect to condition list page" do
        post :create, :condition_field => @attr
        response.should redirect_to(condition_fields_path)
      end
      
      it "should create condition field" do
        lambda do
          post :create, :condition_field => @attr
        end.should change(ConditionField, :count).by(1)
      end
      
      it "should have a success message" do
        post :create, :condition_field => @attr
        flash[:notice].should =~ /Поле успешно добавлено/i
      end
    end
    
  end
  
  describe "PUT 'update'" do
    describe "failure" do
      before(:each) do
        @attr = invalid_data
      end
      
      it "should render the 'edit' page" do
        put :update, :id => @conditionfield.id,
            :condition_field => @attr
        response.should render_template('edit')
      end
      
      it "should not create conditionfield" do
        lambda do
          put :update, :id => @conditionfield.id,
              :condition_field => @attr
        end.should_not change(ConditionField, :count)            
      end
    end

    describe "success" do
      before(:each) do
        @attr = valid_data
      end
      
      it "should redirect to condition fields list" do
        put :update, :id => @conditionfield.id,
            :condition_field => @attr
        response.should redirect_to(condition_fields_path)
      end
      
      it "should not create conditionfield" do
        lambda do
          put :update, :id => @conditionfield.id,
              :condition_field => @attr
        end.should_not change(ConditionField, :count)
      end
      
      it "should success messages" do
        put :update, :id => @conditionfield.id,
            :condition_field => @attr
        flash[:notice].should =~ /Поле успешно обновлено/i
      end
    end

  end
  
  describe "DELETE 'destroy'" do
    
    it "should redirect to conditionfields list" do
      delete :destroy, :id => @conditionfield.id
      response.should redirect_to(condition_fields_path)
    end
    
    it "should destroy the conditionfield" do
      lambda do
        delete :destroy, :id => @conditionfield.id
      end.should change(ConditionField, :count).by(-1)
    end
    
    it "should success message" do
      delete :destroy, :id => @conditionfield.id
      flash[:notice].should =~ /Поле успешно удалено/i
    end
  end
  
  def invalid_data
    {
      :namefield => "Телефон",
      :typefield => ""
    }
  end
  
  def valid_data
    {
      :namefield => "Интернет",
      :typefield => "select"
    }
  end
end

# todo routes spec