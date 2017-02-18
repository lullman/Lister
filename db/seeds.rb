# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all
List.destroy_all
Item.destroy_all

ltu = User.create(username: "lullman", password: "Edsrun98", first_name: "Lindsey", last_name: "Ullman")
pdu = User.create(username: "pullman", password: "Edsrun98", first_name: "Paula", last_name: "Ullman")
cau = User.create(username: "cullman", password: "Edsrun98", first_name: "Curt", last_name: "Ullman")
sdu = User.create(username: "sullman", password: "Edsrun98", first_name: "Schuyler", last_name: "Ullman")
zcu = User.create(username: "zullman", password: "Edsrun98", first_name: "Zane", last_name: "Ullman")
gmu = User.create(username: "mullman", password: "Edsrun98", first_name: "Max", last_name: "Ullman")

family = [ ltu, pdu, cau, sdu, zcu, gmu ]

family.each do |fam|
  list = fam.lists.create(list_name: "#{fam.first_name}'s Christmas List")
  collabs = family.select { |f| f != fam }.sample(3)
  list.collaborators << collabs
  5.times.each do |x|
    list.items << Item.create(item_name: Faker::Book.title)
  end
end

# 5.times.each do |x|
  # ltu_wish_list.items << Item.create(item_name: Faker::Beer.name)
# end

# list1 = User.find(4).lists.first
# list2 = User.find(6).lists.first

# 5.times.each do |x|
#   list1.items << Item.create(item_name: Faker::Book.title)
# end

# 5.times.each do |x|
#   list2.items << Item.create(item_name: Faker::Commerce.product_name)
# end
