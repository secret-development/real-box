# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :document do
    transaction_id 1
    doc "MyString"
  end
end
