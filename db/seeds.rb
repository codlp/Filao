# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Task.destroy_all

User.destroy_all
Project.destroy_all
puts "destroyed every users, projects and tasks"

coralie = User.create!(email: "coralie.d@filao.co", password: "123456", first_name: "Coralie ", last_name: "Delpha", photo: 'images/coralie.png')
amelie = User.create!(email: "amelie.perrier@filao.co", password: "123456", first_name: "Amélie ", last_name: "Perrier", photo: 'images/amelie.png')
elie = User.create!(email: "elie.perrier@filao.co", password: "123456", first_name: "Elie ", last_name: "Perrier", photo: 'images/elie.png')
grace = User.create!(email: "grace.mehrabe@filao.co", password: "123456", first_name: "Grace ", last_name: "Mehrabe", photo: 'images/grace.png')

jason = User.create!(email: "jason.perrier@filao.co", password: "123456", first_name: "Jason ", last_name: "Perrier", photo: 'images/jason.png', is_customer: true, company: "Microsoft")
matt = User.create!(email: "matt.perrier@filao.co", password: "123456", first_name: "Matt", last_name: "Perrier", photo: 'images/matt.png', is_customer: true, company: "IBM")

landing_page = Project.create!(user: grace, customer: amelie, name: "Landing page creation", description: "Small shop landing page work", category: "Web development")
chatbot = Project.create!(user: coralie, customer: amelie, name: "Chatbot Project", description: "Big project for important CAC40 customer", category: "Software")

puts "project created"


step1 = Step.create!(project_id: Project.last.id, name: "Wireframes", is_completed: false)
step2 = Step.create!(project_id: Project.last.id, name: "Development", is_completed: false)
step3 = Step.create!(project_id: Project.last.id, name: "Testing", is_completed: false)
step4 = Step.create!(project_id: Project.second_to_last.id, name: "Wireframes", is_completed: false)
step5 = Step.create!(project_id: Project.second_to_last.id, name: "Development", is_completed: false)
step6 = Step.create!(project_id: Project.second_to_last.id, name: "Testing", is_completed: false)

puts "steps created"

Task.create!(project: chatbot, step: step1, name: 'documentation', description: 'check messenger bot doc')
Task.create!(project: chatbot, step: step2, name: 'code', description: 'je code')
Task.create!(project: chatbot, step: step3, name: 'debug', description: 'je debug')
Task.create!(project: landing_page, step: step5, name: 'documentation', description: 'check w3school bot doc')

