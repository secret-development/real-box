#encoding: UTF-8

require 'spec_helper'

describe UsersController do
  render_views
  
  describe "GET 'show'" do
    
    before(:each) do
      @user = Factory(:user)
    end
    it "get show" do
      get :show, :id => @user
      response.should be_success
    end
    
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
    get :edit
    response.should be_success
  end
  
  describe "POST 'create'" do
    
    describe "failure" do
      
      before(:each) do
        @attr = invalid_data
      end
      
      it "should render the 'new' page" do
        post :create, :user => @attr
        response.should render_template('new')
      end
      
      it "should not create a user" do
        lambda do
          post :create, :user => @attr
        end.should_not change(User, :count)
      end
      
    end
    
    describe "success" do
      
      before(:each) do
        @attr = valid_data
      end
      
      it "should create a user" do
        lambda do
          post :create, :user => @attr
        end.should change(User, :count).by(1)
      end
      
      it "should redirect to the show user page" do
        post :create, :user => @attr
        response.should redirect_to(user_path(assigns(:user)))
      end
      
      it "should have a success message" do
        post :create, :user => @attr
        flash[:notice].should =~ /Персонал успешно добавлен/i
      end
      
    end
    
  end
  
end
