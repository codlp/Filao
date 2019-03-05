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


chatbot = Project.create!(user: coralie, customer: matt, name: "Nucleo Mobile App", description: "Creation of the whole native application", category: "Software")
landing_page = Project.create!(user: coralie, customer: matt, name: "Landing page creation", description: "Small shop landing page work", category: "Web development")

puts "project created"

step4 = Step.create!(project_id: Project.second_to_last.id, name: "Wireframes", is_completed: false)
step5 = Step.create!(project_id: Project.second_to_last.id, name: "Development", is_completed: false)
step6 = Step.create!(project_id: Project.second_to_last.id, name: "Testing", is_completed: false)
step1 = Step.create!(project_id: Project.last.id, name: "Wireframes", is_completed: false)
step2 = Step.create!(project_id: Project.last.id, name: "Development", is_completed: false)
step3 = Step.create!(project_id: Project.last.id, name: "Testing", is_completed: false)

puts "steps created"

task1 = Task.create!(project: landing_page, step: step1, name: 'Documentation', description: 'check messenger bot doc', is_done: true)
task2 = Task.create!(project: landing_page, step: step1, name: 'User sessions', description: 'check messenger bot doc', is_done: true)
task3 = Task.create!(project: landing_page, step: step1, name: 'Profile pages', description: 'check messenger bot doc', is_done: true)
task4 = Task.create!(project: landing_page, step: step2, name: 'Code', description: 'je code', is_done: true)
task5 = Task.create!(project: landing_page, step: step2, name: 'Policies', description: 'je code', is_done: true)
task6 = Task.create!(project: landing_page, step: step2, name: 'Messages', description: 'je code', is_done: true)
task7 = Task.create!(project: landing_page, step: step3, name: 'Logo and Icons', description: 'Final logo proposal and validation of icons', is_done: true)
task8 = Task.create!(project: landing_page, step: step3, name: 'Debug', description: 'Debugging some issues related to editing', is_done: true)
task9 = Task.create!(project: landing_page, step: step3, name: 'Footer', description: 'Validated the updated footer')

task10 = Task.create!(project: chatbot, step: step4, name: 'documentation', description: 'check w3school bot doc')
