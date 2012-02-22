#encoding: UTF-8

require 'spec_helper'

describe Transaction do
  
  before(:each) do
    
    @typetransaction = Factory(:typetransaction)
    @statustransaction = Factory(:statustransaction)
    @customer = Factory(:customer)
    @user = Factory(:user)
    
    @attr = {
      :typetransaction_id => 1,
      :statustransaction_id  => 1,
      :name  => "MyString",
      :description  => "MyText",
      :price  => 1000,
      :customer_id => 4,
      :user_id => 2,
      :payment =>  false
    }
  end
  
  describe "validates presence" do
    
    it "should create a new instance given a valid attribute" do
      @transaction = Transaction.create!(@attr)
    end
    
    it "should require the name" do
      req_presence_sub(:name).should_not be_valid
    end
    
    it "should require a description" do
      req_presence_sub(:description).should_not be_valid
    end
    
    it "should require typetransaction_id" do
      req_presence_sub(:typetransaction_id).should_not be_valid
    end
    
    it "should require statustransaction_id" do
      req_presence_sub(:statustransaction_id).should_not be_valid
    end
    
    it "should require customer_id" do
      req_presence_sub(:customer_id).should_not be_valid
    end
    
    it "should require user_id " do
      req_presence_sub(:user_id).should_not be_valid
    end
    
    it "should require price" do
      req_presence_sub(:price).should_not be_valid
    end
    
    # Require presence task(validates :presence => true)
    def req_presence_sub(par)
      @transaction = Transaction.new(@attr.merge(par => ""))
    end
    
  end
  
  describe "other validations" do
    
    it "should require a payment(true or false)" do
      req_inclusion_of(:payment).should_not be_valid
    end
    
    it "should reject names that are too long" do
      long_name = "a" * 141
      long_name_transaction = Transaction.new(@attr.merge(:name => long_name))
      long_name_transaction.should_not be_valid
    end
    
    it "should reject descriptions that are too long" do
      long_description = "a" * 801
      long_desc_transaction = Transaction.new(@attr.merge(:description => long_description))
      long_desc_transaction.should_not be_valid
    end
    
    it "price should be numericality" do
      @attr[:price] = "string_price"
      transaction = Transaction.new(@attr)
      transaction.should_not be_valid
    end
    
    def req_inclusion_of(par)
      @transaction = Transaction.new(@attr.merge(par => ""))
    end
    
  end
    
  describe "typetransactions associations" do
      
    it "should respond to typetransaction" do
      @transaction = Transaction.new(@attr)
      @transaction.should respond_to(:typetransaction) 
    end
      
    it "should belongs_to typetransaction" do
      t = Transaction.reflect_on_association(:typetransaction)
      t.macro.should == :belongs_to
    end
      
  end
  
  describe "statustransactions associations" do
    
    it "should respond to statustransaction" do
      @transaction = Transaction.new(@attr)
      @transaction.should respond_to(:statustransaction)  
    end
    
    it "should belongs_to statustransaction" do
      t = Transaction.reflect_on_association(:statustransaction)
      t.macro.should == :belongs_to
    end
    
  end
  
  describe "customers associations" do
    
    it "should respond to cusomer" do
      @transaction = Transaction.new(@attr)
      @transaction.should respond_to(:customer)
    end
    
    it "should belongs_to customer" do
      t = Transaction.reflect_on_association(:customer)
      t.macro.should == :belongs_to
    end
    
  end
  
  describe "users associations" do
    
    it "should respond to user" do
      @transaction = Transaction.new(@attr)
      @transaction.should respond_to(:user)
    end
    
    it "should belongs_to user" do
      t = Transaction.reflect_on_association(:user)
      t.macro.should == :belongs_to
    end
    
  end
  
  describe "helper methods" do
    
    describe "payment_value" do
      it "should be 'Оплачена' or 'Не оплачена' instead of 'true' or 'false'" do
        @transaction = Transaction.create!(@attr)
        if @transaction.payment = true
          @transaction.payment_value.should == "Оплачена"
        else
          @transaction.payment_value.should == "Не оплачена"
        end
      end  
    end
    
    describe "button_value" do
      it "should be 'Добавить' or 'Обновить'" do
        @transaction = Transaction.create!(@attr)
        if @transaction.new_record?
          @transaction.button_value.should == "Добавить"
        else
          @transaction.button_value.should == "Обновить"
        end
      end
    end
    
    describe "legend" do
      it "should be 'Добавление' or 'Редактирование'" do
        @transaction = Transaction.create!(@attr)
        if @transaction.new_record?
          @transaction.legend.should == "Добавление"
        else
          @transaction.legend.should == "Редактирование"
        end
      end
    end
        
  end
  
end
