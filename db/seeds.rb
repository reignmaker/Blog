# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
(1..5).each do |blog|
  Blog.create(:name => "Blog name-#{blog}")
  (1..3).each do |post|
    Post.create(:title => Faker::Lorem.words.join(" "), :body => Faker::Lorem.paragraphs.join("\n"), :blog_id => blog)
  end
  puts "Blog name-#{blog} created"
end