# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :transaction do
    name "MyString"
    description "MyText"
    price 1
    payment false
  end
end