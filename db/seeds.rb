# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'random_data'
require 'faker'

10.times do
  User.create!(
    email: Faker::Internet.email,
    password: 'password',
    confirmed_at: Time.now
  )
end
users = User.all

20.times do
  wiki = Wiki.create!(
    user: users.sample,
    title: Faker::Seinfeld.character,
    body: Faker::Seinfeld.quote
  )
end
wikis = Wiki.all



puts "Seed finished"
puts "#{Wiki.count} wikis created"
puts "#{User.count} users created"
