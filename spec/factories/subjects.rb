# -*- encoding : utf-8 -*-
# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :subject do
    price 10000
    area 73
    address "Абая 165, 8"
    floor 7
  end
end
