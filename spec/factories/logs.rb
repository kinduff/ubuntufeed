# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :log do
    type 1
    new_posts 1
    ids_posts "MyText"
  end
end
