# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# user.roles << Role.find_by_name("admin") unless user.roles.where(name: "admin").exists?
Role.roles.each do |role|
  Role.create(name: role)
end

Tag.tags.each do |tag|
  Tag.create(title: tag)
end

Expertise.expertises.each do |expertise|
  Expertise.create(title: expertise)
end

admin = User.create(email: "admin@gmail.com", password: "abcdef", password_confirmation: "abcdef", first_name: "Admin", last_name: "Admin")
admin.roles << Role.find_by_name("admin") unless admin.roles.where(name: "admin").exists?
admin.roles << Role.find_by_name("mentor") unless admin.roles.where(name: "mentor").exists?

mentor = User.create(email: "mentor@gmail.com", password: "abcdef", password_confirmation: "abcdef", first_name: "Mentor", last_name: "Mentor")
mentor.roles << Role.find_by_name("mentor") unless mentor.roles.where(name: "mentor").exists?

regular = User.create(email: "regular@gmail.com", password: "abcdef", password_confirmation: "abcdef", first_name: "Regular", last_name: "Regular")


testuser = User.create(email: "test@gmail.com", password: "abcdef", password_confirmation: "abcdef", first_name: "Test", last_name: "User")
