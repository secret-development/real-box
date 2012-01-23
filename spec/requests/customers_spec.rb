# encoding: UTF-8
require 'spec_helper'

describe "Customers" do
  describe "GET /customers" do
    it "displays customers" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      Customer.create!(:firstname => "Alesha", :lastname => "Popovich")
      visit customers_path
      page.should have_content("Alesha")
      page.should have_content("Popovich")
    end
  end
  
  describe "Post /customers" do
    it "create customer" do
      visit new_customer_path                
      fill_in :firstname, :with => "Vasya"
      fill_in :lastname, :with => "Chapaev"
      click_button "Сохранить"
      #save_and_open_page     
    end    
  end

  describe "link_to " do
    it "link_to show" do
      visit customers_path
      click_link "Просмотр"
      #page.should have_content("")
      #response.should render_template('customers/show') 
    end    
  end

end
