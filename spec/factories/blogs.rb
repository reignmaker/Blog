# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :blog do
    name Faker::Lorem.words.join(" ")
  end
end
