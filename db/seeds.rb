# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

[:music, 
 :film,
 :science, 
 :geography,
 :literature,
 :history,
 :famous_people,
 :food_and_drink,
 :other].each do |name|
   Category.create(name:name)
 end