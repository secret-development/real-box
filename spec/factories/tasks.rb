# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :task do
    title "MyString"
    description "MyText"
    user_id 1
    deadline "2012-02-08"
    done false
  end
end
