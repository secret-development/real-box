# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :task do
    title "MyString"
    description "MyText"
    user_id 1
    deadline "2050-02-08 13:58:15"
    done false
  end
end
