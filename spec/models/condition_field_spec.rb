# encoding:utf-8
require 'spec_helper'

describe ConditionField do

  before(:each) do

    @conditionfield = Factory(:condition_field)
    
    @typefields = { 
      "выпадающий список" => "select",
      "радио кнопки" => "radio",
      "чекбоксы" => "checkbox",
      "текстовое поле" => "textfield",
      "большое текстовое поле" => "textarea"
      }
      
    @attr = {
      :namefield => "Состояние",
      :typefield => @typefields["выпадающий список"]
    }
    
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
    
    it "should reject duplicate namefield" do
      ConditionField.create!(@attr)
      condition_field_with_dup = ConditionField.new(@attr)
      condition_field_with_dup.should_not be_valid
    end
  end
end
