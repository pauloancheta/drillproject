# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(email: 'admin@example.com', password: 'password123', is_admin: true)
Level.create([{ title: "Beginner "}, {title: "Intermediate"},{title: "Advanced"}])
Tag.create([{title: "Ruby"}, {title: "Javascript"}, {title: "HTML/CSS"}])