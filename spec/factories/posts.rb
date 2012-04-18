# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :post do
    title "Hello World!"
    body "Hi there!"
    association :blog
  end
end
