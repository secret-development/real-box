require 'spec_helper'

describe User do
  before(:each) do
    @attr = {
      :email => "agent@mail.ru",
      :password => "password",
      :password_confirmation => "password"
    }
  end 
  
  it "should create user" do
    User.create!(@attr)  
  end
  
  it "should require email" do
    null_email = User.new(@attr.merge(:email => ""))
    null_email.should_not be_valid    
  end
end
