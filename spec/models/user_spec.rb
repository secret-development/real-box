##encoding:utf-8
require 'spec_helper'

describe User do
  
  before(:each) do
    @attr = { 
          :last_name => "Александров",
          :first_name => "Александр",
          :middle_name => "Александрович",
          :email => "user@example.com",
          :birth_date => "5.05.1985",
          :phone => "87773334455",
          :adress => "г. Костанай, ул. Гагарина, д. 7, кв. 34"
        }
  end
  
  describe "validates presence" do
    
    it "should create a new instance given a valid attribute" do
      @user = User.create!(@attr)
    end

    it "should require a last name" do
      req_presence_sub(:last_name).should_not be_valid
    end

    it "should require a first name" do
      req_presence_sub(:first_name).should_not be_valid
    end

    it "should require a middle name" do
      req_presence_sub(:middle_name).should_not be_valid
    end

    it "should require adress" do
      req_presence_sub(:adress).should_not be_valid
    end

    it "should require email" do
      req_presence_sub(:email).should_not be_valid
    end

    it "should require phone" do
      req_presence_sub(:phone).should_not be_valid
    end

    it "should require birth date" do
      req_presence_sub(:birth_date).should_not be_valid
    end

    # Require presence user(validates :presence => true)
    def req_presence_sub(par)
      @user = User.new(@attr.merge(par => ""))
    end
    
  end
  
  describe "other validations" do
    
    it "should reject first names that are too long" do
        long_first_name = "a" * 51
        long_first_name_user = User.new(@attr.merge(:first_name => long_first_name))
        long_first_name_user.should_not be_valid
    end
    
    it "should reject last names that are too long" do
        long_last_name = "a" * 51
        long_last_name_user = User.new(@attr.merge(:last_name => long_last_name))
        long_last_name_user.should_not be_valid
    end
    
    it "should reject middle names that are too long" do
        long_middle_name = "a" * 51
        long_middle_name_user = User.new(@attr.merge(:middle_name => long_middle_name))
        long_middle_name_user.should_not be_valid
    end
    
    it "should accept valid email addresses" do
      addresses = %w[user@foo.com THE_USER@foo.bar.org first.last@foo.jp]
      addresses.each do |address|
        valid_email_user = User.new(@attr.merge(:email => address))
        valid_email_user.should be_valid
      end
    end

    it "should reject invalid email addresses" do
      addresses = %w[user@foo,com user_at_foo.org example.user@foo.]
      addresses.each do |address|
        invalid_email_user = User.new(@attr.merge(:email => address))
        invalid_email_user.should_not be_valid
      end
    end
    
    it "should reject duplicate email addresses" do
      User.create!(@attr)
      user_with_duplicate_email = User.new(@attr)
      user_with_duplicate_email.should_not be_valid
    end

    it "should reject email addresses identical up to case" do
      upcased_email = @attr[:email].upcase
      User.create!(@attr.merge(:email => upcased_email))
      user_with_duplicate_email = User.new(@attr)
      user_with_duplicate_email.should_not be_valid
    end
    
  end
  
  describe "helper methods" do
    
    describe "full_name" do
      it "should combine name and middle_name" do
        @user = User.create!(@attr)
        @user.full_name.should == @user.last_name + ' ' + @user.first_name + ' ' + @user.middle_name 
      end
    end
    
    describe "legend" do
      it "should write 'Добавление' or 'Редактирование'" do
        @user = User.create!(@attr)
        if @user.new_record?
          @user.legend.should == "Добавление"
        else
          @user.legend.should == "Редактирование"
        end
      end
    end
    
    describe "button_value" do
      it "should write 'Добавить' or 'Обновить'" do
        @user = User.create!(@attr)
        if @user.new_record?
          @user.button_value.should == "Добавить"
        else
          @user.button_value.should == "Обновить"
        end
      end
    end
    
  end
  
  describe "task associations" do
    
    it "should respond to tasks" do
      @user = User.new(@attr)
      @user.should respond_to(:tasks)
    end
    
    it "should have many tasks" do
      u = User.reflect_on_association(:tasks)
      u.macro.should == :has_many
    end
    
    it "should dependent destroy" do
      u = User.reflect_on_association(:tasks)
      u.options[:dependent].should == :destroy
    end
    
  end
  
end

## == Schema Information
#
# Table name: users
#
#  id          :integer(4)      not null, primary key
#  email       :string(255)
#  last_name   :string(255)
#  first_name  :string(255)
#  middle_name :string(255)
#  birth_date  :date
#  adress      :string(255)
#  phone       :string(255)
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#

