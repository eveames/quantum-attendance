# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

order = 0
['white', 'high white', 'yellow', 'high yellow', 'green', 'high green', 'blue', 'high blue', 'red', 'high red', 'black'].each do |belt|
  order = order + 1
  Belt.create_with(is_active: true, order_by: order).find_or_create_by(name: belt)
end

schools = [
  {
    name: "Seattle"
  },
  {
    name: "San Francisco"
  },
  {
    name: "Black Rock City"
  }
]

schools.each do |school|
  School.create_with(is_active: true).find_or_create_by(name: school[:name])
end

students = [
  {
    first_name: "Alex",
    last_name: "Kleissner",
    school: "Seattle",
    belt: "high yellow"
  },
  {
    first_name: "Tony",
    last_name: "Evans",
    school: "Seattle",
    belt: "red"
  },
  {
    first_name: "Derrick",
    last_name: "Louie",
    school: "Seattle",
    belt: "high white"
  },
  {
    first_name: "Anthony",
    last_name: "Hernandez",
    school: "San Francisco",
    belt: "high yellow"
  },
  {
    first_name: "Rachel",
    last_name: "Evans",
    school: "San Francisco",
    belt: "black"
  }
]

students.each do |student|
  member = Member.create_with(is_active: true).find_or_create_by(first_name: student[:first_name], last_name: student[:last_name])
  member.belt = Belt.find_by_name(student[:belt])
  member.school = School.find_by_name(student[:school])
  member.save
end

meeting_types = ['Advanced', 'Basics', 'Belt Test', 'Concepts/Spar', 'Conditioning', 'Forms', 'General', 'Grappling', 'Green']

meeting_types.each do |type|
  MeetingType.create_with(is_active: true).find_or_create_by(name: type)
end
