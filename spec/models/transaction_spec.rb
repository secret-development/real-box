#encoding: UTF-8

require 'spec_helper'

describe Transaction do
  
  before(:each) do
    @user = Factory(:user)
    @city = Factory(:city)
    @typesubject = Factory(:typesubject)
    @district = Factory(:district)
    @customer = Factory(:customer)
    @typetransaction = Factory(:typetransaction)
    @subject = Factory(:subject, :typesubject => @typesubject, :city => @city, 
        :customer => @customer, :district => @district)
    @transaction = Factory(:transaction, :typetransaction => @typetransaction,
                    :user => @user, :customer => @customer,
                    :subject => @subject)
    
    @attr = {
      :name => "name",
      :description => "description",
      :price => 1000,
      :payment => false,
      :user_id => @user.id,
      :customer_id => @customer.id,
      :subject_id => @subject.id,
      :typetransaction_id => @typetransaction.id
    }
    
  end
  
  describe "validates presence" do
    
    it "should create a new instance given a valid attributes" do
      @transaction = Transaction.create!(@attr)
    end
    
    it "should require the name" do
      req_presence_sub(:name).should_not be_valid
    end
    
    it "should require a description" do
      req_presence_sub(:description).should_not be_valid
    end
    
    it "should require a price" do
      req_presence_sub(:price).should_not be_valid
    end
    
    it "should require user's id" do
      req_presence_sub(:user_id).should_not be_valid
    end
    
    it "should require customer's id" do
      req_presence_sub(:customer_id).should_not be_valid 
    end
    
    it "should require typetransaction's id" do
      req_presence_sub(:typetransaction_id).should_not be_valid
    end
    
    # Require presence transaction(validates :presence => true)
    def req_presence_sub(par)
      @transaction = Transaction.new(@attr.merge(par => ""))
    end
    
  end
  
  describe "other validations" do
    
    it "should require 'payment' field (true or false)" do
      req_inclusion_of(:payment).should_not be_valid
    end
    
    it "should reject names that are too long" do
      long_name = "a" * 141
      long_name_transaction = Transaction.new(@attr.merge(:name => long_name))
      long_name_transaction.should_not be_valid
    end
    
    it "should reject descriptions that are to long" do
      long_desc = "a" * 801
      long_desc_transaction = 
      Transaction.new(@attr.merge(:description => long_desc))
      long_desc_transaction.should_not be_valid
    end
    
    it "price should be a number" do
      @attr[:price] = "string-price"
      @transaction = Transaction.new(@attr)
      @transaction.should_not be_valid
    end
    
    # Require inclusion_of transaction(validates_inclusion_of :in => [true, false])
    def req_inclusion_of(par)
      @transaction = Transaction.new(@attr.merge(par => ""))
    end
    
  end
  
  describe "associations" do
    
    describe "user associations" do
      
      it "should respond to user" do
        @transaction = Transaction.new(@attr)
        @transaction.should respond_to(:user)
      end
      
      it "should belongs_to user" do
        t = Transaction.reflect_on_association(:user)
        t.macro.should == :belongs_to
      end
      
    end
    
    describe "customer association" do
      
      it "should respond to customer" do
        @transaction = Transaction.new(@attr)
        @transaction.should respond_to(:customer)
      end
      
      it "should belongs_to customer" do
        t = Transaction.reflect_on_association(:customer)
        t.macro.should == :belongs_to
      end
      
    end
    
    describe "typetransaction associations" do
      
      it "should respond to typetransaction" do
        @transaction = Transaction.new(@attr)
        @transaction.should respond_to(:typetransaction)
      end
      
      it "should belongs_to typetransaction" do
        t = Transaction.reflect_on_association(:typetransaction)
        t.macro.should == :belongs_to 
      end
      
    end
    
    describe "subject associations" do
      
      it "should respond to subject" do
        @transaction = Transaction.new(@attr)
        @transaction.should respond_to(:subject)
      end
      
      it "should belongs_to subject" do
        t = Transaction.reflect_on_association(:subject)
        t.macro.should == :belongs_to
      end
      
    end
    
  end
  
  describe "helper methods" do
    
    describe "payment methods" do
      
      it "should write 'Да ' if payment is true" do
        @transaction = Transaction.new(:payment => true)
        @transaction.payment_value.should eql("Сделка оплачена")
      end
      
      it "should write 'Нет' if payment is false" do
        @transaction = Transaction.new(:payment => false)
        @transaction.payment_value.should eql("Сделка не оплачена")
      end
      
    end
    
    describe "legend method" do
      
      it "should write 'Добавление' if new record" do
        @transaction = Transaction.new(@attr)
        @transaction.legend.should == "Добавление"
      end
      
      it "should write 'Редактирование' if it is not" do
        @transaction = Transaction.new(@attr)
        @transaction.save  
        @transaction.legend.should == "Редактирование"
      end
      
    end
    
    describe "button_value method" do
      
      it "should write 'Добавить' if new record" do
        @transaction = Transaction.new(@attr)
        @transaction.button_value.should == "Добавить"
      end
        
      it "should write 'Добавить' if it is not" do
        @transaction = Transaction.new(@attr)
        @transaction.save    
        @transaction.button_value.should == "Обновить"
      end
      
    end
    
  end
  
end
