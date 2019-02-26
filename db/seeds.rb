# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Project.destroy_all
puts "destroyed every user & projects"

coralie = User.create(email: "coralie.d@gmail.com", password: "123456", first_name: "Coralie ", last_name: "Delpha", photo: 'images/avatar.svg')
amelie = User.create(email: "amelie.perrier@gmail.com", password: "123456", first_name: "Amélie ", last_name: "Perrier", photo: 'images/avatar.svg')
grace = User.create(email: "grace.mehrabe@gmail.com", password: "123456", first_name: "Grace ", last_name: "Mehrabe", photo: 'images/avatar.svg')


project = Project.create(user: coralie, customer: amelie, name: "Chatbot Project", description: "Big project for important CAC40 customer")

puts "project created"
