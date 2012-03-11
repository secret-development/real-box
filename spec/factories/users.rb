# -*- encoding : utf-8 -*-

FactoryGirl.define do
  factory :user do
    email "agent@mail.ru"
    password "MyString"
    password_confirmation "MyString"
    lastname "Иванов"
    firstname "Иван"
    role true
    phonemobile "+7 777 474 4343"
  end
  factory :User do
    email "new@mail.ru"
    lastname "Петров"
    firstname  "Петр"
    password  "123456"
    password_confirmation "123456"
    role false
  end
end
