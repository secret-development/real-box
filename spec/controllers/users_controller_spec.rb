#encoding: UTF-8

require 'spec_helper'

describe UsersController do
  render_views
  
  before(:each) do
    @user = Factory(:user)
  end
    
  it "get show" do
    get :show, :id => @user
    response.should be_success
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
    get :edit, :id => @user.id
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
  
  describe "PUT 'update'" do
    
    describe "failure update" do
      
      before(:each) do
        @attr = invalid_data
      end
      
      it "should render the 'edit' page" do
        put :update, :id => @user.id, :user => @attr
        response.should render_template('edit')
      end
      
      it "should not update a user" do
        lambda do
          put :update, :id => @user.id, :user => @attr
        end.should_not change(User, :count)
      end
      
    end
  
  describe "success update" do
    
    before(:each) do
      @attr = valid_data
    end
    
    it "should redirect to user" do
      put :update, :id => @user.id, :user => @attr
      response.should redirect_to(user_path(assigns(:user)))
    end
    
    it "should not create a user" do
      lambda do
        put :update, :id => @user.id, :user => @attr
      end.should_not change(User, :count)
    end
    
    it "should have a success message" do
      put :update, :id => @user.id, :user => @attr
      #flash[:notice].should =~ /Персонал успешно обновлён/i
      flash[:notice].should eql("Персонал успешно обновлен")
    end
    
  end
    
  end
  
  def valid_data
    {
      :email => "mystring@gmail.com",
      :first_name => "Aleksandr",
      :last_name => "Aleksandrov",
      :middle_name => "Aleksandrovich",
      :phone => "87777777777",
      :adress => "uuddkks 7, sakdh 4",
      :birth_date => "1987-01-05"
    }  
  end
  
  def invalid_data
    {
      :email => "mystring@gmail.com",
      :first_name => "",
      :last_name => "",
      :middle_name => "",
      :phone => "87777777777",
      :adress => "uuddkks 7, sakdh 4",
      :birth_date => "1987-01-05"
    }
  end
  
end
