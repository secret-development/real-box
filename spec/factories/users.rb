# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    email "MyString"
    last_name "MyString"
    first_name "MyString"
    middle_name "MyString"
    birth_date "2012-01-25"
    adress "MyString"
    phone "MyString"
  end
end
