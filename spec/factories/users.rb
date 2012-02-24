# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    email "agent@mail.ru"
    password "MyString"
    password_confirmation "MyString"
  end
end
