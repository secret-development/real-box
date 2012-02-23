#encoding: UTF-8
# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :transaction do
    typetransaction_id 1
    statustransaction_id 1
    name "MyString"
    description "MyText"
    price 1000
    customer_id 4
    user_id 2
    payment false
  end
end
