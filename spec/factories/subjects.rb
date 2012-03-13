# -*- encoding : utf-8 -*-
# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :subject do
    price 10000
    area 73
    address "Абая 165, 8"
    floor 3
    room 3
    active true
    price_currency "доллар"
  end
  
  factory :subject_active_false, :class => Subject do
    price 10000
    area 73
    address "Абая 165, 8"
    floor 7
    room 4
    active false
    price_currency "доллар"
  end
end
