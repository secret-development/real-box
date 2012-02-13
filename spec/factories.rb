# encoding:utf-8
Factory.define :customer do |customer|
  customer.firstname      "Ivan"
  customer.lastname       "Ivanov"
  customer.phonehome      "853049853"
  customer.phonemobile    "853049853"
  customer.email          "vanya@mail.ru"
  customer.real           true
  customer.note           "bla-bla-bla"
end

#Factory.define :type_customer_with_customer, :parent => :type_customer do |type|
#  type.after_create { |a| Factory(:customer, :type_customer => a)}  
#end

#Factory.define :social_status_with_customer, :parent => :social_status do |social|
#  social.after_create { |b| Factory(:customer, :social_status => b)}  
#end
