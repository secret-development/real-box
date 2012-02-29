# encoding:utf-8
require 'spec_helper'

describe User do
  before(:each) do
    @attr = {
      :email => "agent@mail.ru",
      :password => "password",
      :password_confirmation => "password",
      :lastname => "Петров",
      :firstname => "Петр",
    }
  end 
  
  # validation invalid
  describe "invalid validation" do
    
    it "should require email" do
      null_email = User.new(@attr.merge(:email => ""))
      null_email.should_not be_valid    
    end
    
    it " should invalid email" do
      mail = %w[man@ru woman@mail,ru]
      mail.each  do |mail|
        invalid_email = User.new(@attr.merge(:email => mail))
        invalid_email.should_not be_valid
      end    
    end
    
    it "should reject duplicate email" do
      User.create(@attr)
      duplicate_email = User.new(@attr)
      duplicate_email.should_not be_valid    
    end
    
    it "should reject duplicate upcase email" do
      upcase_email = @attr[:email].upcase
      User.create!(@attr.merge(:email => upcase_email))
      user_duplicate_email = User.new(@attr)
      user_duplicate_email.should_not be_valid    
    end
  
    it "should require lastname" do
      not_lastname = User.new(@attr.merge(:lastname => ""))
      not_lastname.should_not be_valid    
    end
    
    it "should require firstname" do
      not_firstname = User.new(@attr.merge(:firstname => ""))
      not_firstname.should_not be_valid      
    end
      
  end
  
  # success validation
  describe "success validation" do
      
    it "should create user" do
      User.create!(@attr)  
    end
    
    it "should accept valid email" do
      mail = %w[man@mail.ru Woman@mail.ru]
      mail.each do |mail|
        valid_email = User.new(@attr.merge(:email => mail))
        valid_email.should be_valid
      end    
    end  
  
  end
  
  describe "test methods" do
    it "legend value for new" do
      @user = User.new(@attr)
      @user.legend_value.should == "Добавление нового сотрудника"      
    end
    
    it "legend value for update" do
      @update = User.create!(@attr)
      @update.firstname = "Ваня"
      @update.legend_value.should == "Изменение"      
    end
    
  end
    
end
