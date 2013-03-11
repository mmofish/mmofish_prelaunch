# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Environment variables (ENV['...']) are set in the file config/application.yml.
# See http://railsapps.github.com/rails-environment-variables.html
puts 'ROLES'
YAML.load(ENV['ROLES']).each do |role|
  Role.find_or_create_by_name({ :name => role }, :without_protection => true)
  puts 'role: ' << role
end
puts 'DEFAULT USERS'
user = User.find_or_create_by_email :name => ENV['ADMIN_NAME'].dup, :email => ENV['ADMIN_EMAIL'].dup, :password => ENV['ADMIN_PASSWORD'].dup, :password_confirmation => ENV['ADMIN_PASSWORD'].dup
puts 'user: ' << user.name
user.confirm!
user.add_role :admin

user2 = User.find_or_create_by_email :name => ENV['MIZPAH_NAME'].dup, :email => ENV['MIZPAH_EMAIL'].dup, :password => ENV['MIZPAH_PASSWORD'].dup, :password_confirmation => ENV['MIZPAH_PASSWORD'].dup
puts 'user: ' << user2.name
user2.confirm!
user2.add_role :admin

user3 = User.find_or_create_by_email :name => ENV['SHINOGI_NAME'].dup, :email => ENV['SHINOGI_EMAIL'].dup, :password => ENV['SHINOGI_PASSWORD'].dup, :password_confirmation => ENV['SHINOGI_PASSWORD'].dup
puts 'user: ' << user3.name
user3.confirm!
user3.add_role :VIP