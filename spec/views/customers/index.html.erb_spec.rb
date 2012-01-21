# encoding: UTF-8
require 'spec_helper'

describe "customer/index.html.erb" do
  it "displays all the customer" do
    assign(:customers, [
      stub_model(Customer, :firstname => "Ivan"),
      stub_model(Customer, :firstname => "Serega")
    ])
   
    
    render :template => "customers/index.html.erb"
    
    rendered.should =~ /Ivan/
    rendered.should =~ /Serega/    
  end
  
end
