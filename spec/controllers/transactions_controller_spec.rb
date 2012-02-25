#encoding: UTF-8
require 'spec_helper'

describe TransactionsController do
  render_views
  
  before(:each) do
    controller.stub!(:all_deny)
    @transaction = Factory(:transaction)
    @user = Factory(:user)
  end
  
  it "get index" do
    get :index
    response.should be_success
  end
  
  it "get new" do
    get :new
    response.should be_success
  end
  
  it "get show" do
    get :show, :id => @transaction.id
    response.should be_success
  end

  it "get edit" do
    get :edit, :id => @transaction.id
    response.should be_success
  end
  
  describe "POST 'create'" do
    
    describe "failure" do
      
      before(:each) do
        @attr = invalid_data
      end
      
      it "should render the 'new' page" do
        post :create, :transaction => @attr
        response.should render_template('new')
      end
      
      it "should not create a transaction" do
        lambda do
          post :create, :transaction => @attr
        end.should_not change(Transaction, :count)
      end
      
    end
    
    describe "success" do
      
      before(:each) do
        @attr = valid_data
      end
      
      it "should create a transaction" do
        lambda do
          post :create, :transaction => @attr
        end.should change(Transaction, :count).by(1)
      end
      
      it "should redirect to transactions" do
        post :create, :transaction => @attr
        response.should redirect_to transactions_path
      end
            
      it "should have a success message" do
        post :create, :transaction => @attr
        flash[:notice].should =~ /Сделка успешно добавлена/i
      end
      
    end
    
  end
  
  describe "PUT 'update'" do
    
    describe "failure update" do
      
      before(:each) do
        @attr = invalid_data
      end
      
      it "should render the 'edit' page" do
        put :update, :id => @transaction.id, :transaction => @attr
        response.should render_template('edit')
      end
      
      it "should not create a transaction" do
        lambda do
          put :update, :id => @transaction.id, :transaction => @attr
        end.should_not change(Transaction, :count)
      end
      
      it "should not update transaction" do
        lambda do
          put :update, :id => @transaction.id, :transaction => @attr
        end.should_not change(Transaction, :count)
      end
      
    end
    
    describe "success update" do
      
      before(:each) do
        @attr = valid_data
      end
      
      it "should redirect to transactions " do
        put :update, :id => @transaction.id, :transaction => @attr
        response.should redirect_to transactions_path
      end
      
      it "should not create a transaction" do
        lambda do
          put :update, :id => @transaction.id, :transaction => @attr
        end.should_not change(Transaction, :count)
      end
      
      it "should have a success message" do
        put :update, :id => @transaction.id, :transaction => @attr
        flash[:notice].should =~ /Сделка успешно обновлена/i
      end
      
    end
    
  end
  
  describe "DELETE 'destroy'" do
    
    it "should redirect to transactions" do
      delete :destroy, :id => @transaction.id
      response.should redirect_to transactions_path
    end
    
    it "should destroy the transaction" do
      lambda do
        delete :destroy, :id => @transaction.id
      end.should change(Transaction, :count).by(-1)
    end
    
    it "should have a success message" do
      delete :destroy, :id => @transaction.id
      flash[:notice] =~ /Сделка успешно удалена/i
    end
    
  end
  
  def valid_data
    {
      :typetransaction_id => 1,
      :statustransaction_id => 1,
      :name => "MyTransaction",
      :description => "MyDescription",
      :price => 1000,
      :customer_id => 4,
      :user_id => 2,
      :payment => true
    }
  end
  
  def invalid_data
    {
      :typetransaction_id => 1,
      :statustransaction_id => 1,
      :name => "",
      :description => "",
      :price => 1000,
      :customer_id => "",
      :user_id => 2,
      :payment => "payment"
    }
  end
  
end
