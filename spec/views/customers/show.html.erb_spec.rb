# encoding: UTF-8
require 'spec_helper'

describe "customers/show.html.erb" do
  it "diplays information about customer" do
    assign(:customer, stub_model(Customer, :firstname => "Roma", :lastname => "Roman" ))
    render :template => "customers/show.html.erb"
    
    rendered.should =~ /Roma/
    rendered.should =~ /Roman/
  end  
end
