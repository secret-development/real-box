# -*- encoding : utf-8 -*-

FactoryGirl.define do
  factory :customer do
    firstname      "Ivan"
    lastname       "Ivanov"
    phonehome      "853049853"
    phonemobile    "853049853"
    email          "vanya@mail.ru"
    potentials     false
    note           "bla-bla-bla"
    lastcall       Time.now.weeks_ago(1)
  end
end
