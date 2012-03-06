# encoding:utf-8
require 'spec_helper'

describe UsersController do
  
  before(:each) do
    # start auth
    @user = Factory(:user)
    test_log_in(@user)
    # end auth
    @new_user = { 
                :lastname => "Горбунов",
                :firstname => "Анатолий",
                :email => "gor@mail.ru",
                :password => "password",
                :password_confirmation => "password"
    }
  end

  describe "returns http success" do
    it "GET 'new'" do
      get :new
      response.should be_success
    end
    
    it "GET 'edit'" do
      get :edit, :id => @user.id
      response.should be_success      
    end
    
    it "GET 'index'" do
      get :index
      response.should be_success      
    end
  end
  
  #post create
  describe "POST 'create'" do
    
    describe "success" do      
      it "create" do
        lambda do
          post :create, :user => @new_user
        end.should change(User, :count).by(1) 
      end 
      
      it "should redirect to users_path" do
        post :create, :user => @new_user
        response.should redirect_to(users_path)        
      end
      
      it "should have a successful message" do
        post :create, :user => @new_user
        flash[:notice].should =~ /Сотрудник создан/i        
      end     
    end  
  end
  

end
