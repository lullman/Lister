# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
lindsey = User.find_by(username: "ltravis79")
ltu_wish_list = lindsey.lists.first

5.times.each do |x|
  # ltu_wish_list.items << Item.create(item_name: Faker::Beer.name)
end

list1 = User.find(4).lists.first
list2 = User.find(6).lists.first

5.times.each do |x|
  list1.items << Item.create(item_name: Faker::Book.title)
end

5.times.each do |x|
  list2.items << Item.create(item_name: Faker::Commerce.product_name)
end
