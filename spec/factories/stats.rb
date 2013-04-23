# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :stat do
    post_id 1
    clicks 1
    client "MyString"
  end
end
