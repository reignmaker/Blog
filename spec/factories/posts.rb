# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :post do
    title Faker::Lorem.words.join(" ")
    body Faker::Lorem.paragraphs.join("\n")
    association :blog
  end
end
