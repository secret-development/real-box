# encoding: utf-8
require 'spec_helper'

describe ValueFieldsController do
  
  before(:each) do
    @conditionfield = Factory(:condition_field)
    @valuefield = Factory(:value_field)
    @attr = {
      :valuefield => "Нет",
      :condition_field_id => @conditionfield.id
    }
  end

  
  
end
