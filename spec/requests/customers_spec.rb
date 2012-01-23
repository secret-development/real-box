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
      visit customers_path
      fill_in :firstname, :with => "Vasya"
      fill_in :lastname, :with => "Vasya"
      click_button "Save"
      response.should render_template('customers/index') 
      #page.should have_content("Vasya")
      #page.should have_content("Chapaev")      
    end    
  end
  

end
