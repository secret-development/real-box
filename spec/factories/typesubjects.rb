# -*- encoding : utf-8 -*-

FactoryGirl.define do
  factory :typesubject do
    name "Коттедж"
    permalink "cottage"
    floor true
  end
  
  factory :withourfloor, :class => Typesubject do
    name "Дача"
    permalink "dacha"
    floor false
  end
  
  factory :withcond, :class => Typesubject do
    name "Квартира"
    permalink "flat"
    floor true
  end
end
