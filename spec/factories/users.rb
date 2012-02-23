# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    email "MyString"
    password_hash "MyString"
    password_salt "MyString"
  end
end
