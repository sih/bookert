# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :booking do
    identifier "MyString"
    nights 1
    rooms 1
    date "MyString"
    room_type "MyString"
    string "MyString"
    price 1
  end
end
