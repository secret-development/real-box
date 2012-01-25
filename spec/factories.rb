# encoding:utf-8
Factory.define :subject do |subject|
  subject.typesubject            "квартира"
  subject.cityname               "костанай"
  subject.township               "центр"
  subject.address                "абая 165, 119"
  subject.price                  70000
  subject.numbofrooms            3
  subject.square                 72.0
  subject.kitchensquare          15.0
  subject.livingsquare           57.0
  subject.floor                  7
  subject.typestructure          "панельный"
  subject.yearofconstruction     1950
  subject.telephone              "yes"
  subject.furniture              "yes"
  subject.internet               "no"
  subject.balcony                "лоджия"
  subject.wc                     "раздельный"
  subject.layout                 "сталинка"
  subject.state                  "отличное"
end

Factory.define :customer do |customer|
  customer.firstname      "Ivan"
  customer.lastname       "Ivanov"
  customer.phonehome      "853049853"
  customer.phonemobile    "853049853"
  customer.email          "vanya@mail.ru"
  customer.typecust       "Покупатель"
  customer.real           true
  customer.note           "bla-bla-bla"
  customer.socialstatus   "Работающий(ая)"
end