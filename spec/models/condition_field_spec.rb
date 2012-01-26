# encoding:utf-8
require 'spec_helper'

describe ConditionField do

  before(:each) do

    @typefields = { 
      "выпадающий список" => "select",
      "радио кнопки" => "radio",
      "чекбоксы" => "checkbox",
      "текстовое поле" => "textfield",
      "большое текстовое поле" => "textarea"
      }
      
    @attr = {
      :namefield => "Санузел",
      :typefield => @typefields["select"]
    }
    
    @conditionfield = Factory(:condition_field)
  end
  
  describe "validates" do
      
    it "should create a new instance given a valid attribute" do
      @conditionfield = ConditionField.create!(@attr)
    end
    
    it "should require namefield" do
      @conditionfield = ConditionField.new(@attr.merge(:namefield => ""))
      @conditionfield.should_not be_valid
    end
    
    it "should require typefield" do
      @conditionfield = ConditionField.new(@attr.merge(:typefield => ""))
      @conditionfield.should_not be_valid
    end
    
    it "typefield should include value of TYPEFIELDS" do
      (@typefields.to_s).should include(@conditionfield.typefield)
    end
  end
end
