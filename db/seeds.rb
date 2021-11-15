# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Cleaning database..."
Animal.destroy_all
User.destroy_all
Species.destroy_all
Reservation.destroy_all


puts 'Creating users (owner side)...'

user1 = { name: "Caroline", is_owner: true, email: "caroline@paw.com", password: "hellopaw", password_confirmation: "hellopaw" }
user2 = { name: "Amelie", is_owner: true, email: "amelie@paw.com", password: "hellopaw", password_confirmation: "hellopaw" }
user3 = { name: "Yasmine", is_owner: true, email: "yasmine@paw.com", password: "hellopaw", password_confirmation: "hellopaw" }
user4 = { name: "Sarah", is_owner: true, email: "sarah@paw.com", password: "hellopaw", password_confirmation: "hellopaw" }
user5 = { name: "Pierre", is_owner: false, email: "pierre@paw.com", password: "hellopaw", password_confirmation: "hellopaw" }
user6 = { name: "Paul", is_owner: false, email: "paul@paw.com", password: "hellopaw", password_confirmation: "hellopaw" }
user7 = { name: "Jacques", is_owner: false, email: "jacques@paw.com", password: "hellopaw", password_confirmation: "hellopaw" }
user8 = { name: "Eric", is_owner: false, email: "eric@paw.com", password: "hellopaw", password_confirmation: "hellopaw" }

[user1, user2, user3, user4, user5, user6, user7, user8].each do |attributes|
  user = User.create!(attributes)
  puts "Created #{user.name}"
end


puts "Creating species..."
species1 = { name: "dog", quality: "for young children" }
species2 = { name: "cat", quality: "eats mouses" }
species3 = { name: "goat", quality: "for the grass" }
species4 = { name: "hen", quality: "for laying eggs" }

[species1, species2, species3, species4].each do |attributes|
  species = Species.create!(attributes)
  puts "Created #{species.name}"
end


puts "Creating animals..."
animal1 = { name: "Wafi", age: 3, address: "20 avenue de la République", price: 50, user: User.where('is_owner = true').sample, species: Species.all.sample }
animal2 = { name: "Marooo", age: 2, address: "35 avenue de la République", price: 22, user: User.where('is_owner = true').sample, species: Species.all.sample }
animal3 = { name: "Wannaa", age: 5, address: "72 avenue de la République", price: 15, user: User.where('is_owner = true').sample, species: Species.all.sample }
animal4 = { name: "Lana", age: 1, address: "2 avenue de la République", price: 62, user: User.where('is_owner = true').sample, species: Species.all.sample }

[animal1, animal2, animal3, animal4].each do |attributes|
  animal = Animal.create!(attributes)
  puts "Created #{animal.name}"
end


puts "Creating reservations..."
reservation1 = { status: "pending", address: "20 avenue de la paw", start_date: DateTime.new(2019,9,1,17), end_date: DateTime.new(2019,9,1,19), user: User.where('is_owner = false').sample, animal: Animal.all.sample }
reservation2 = { status: "pending", address: "35 avenue de la paw", start_date: DateTime.new(2019,9,1,17), end_date: DateTime.new(2019,9,1,19), user: User.where('is_owner = false').sample, animal: Animal.all.sample }
reservation3 = { status: "pending", address: "72 avenue de la paw", start_date: DateTime.new(2019,9,1,17), end_date: DateTime.new(2019,9,1,19), user: User.where('is_owner = false').sample, animal: Animal.all.sample }
reservation4 = { status: "pending", address: "2 avenue de la paw", start_date: DateTime.new(2019,9,1,17), end_date: DateTime.new(2019,9,1,19), user: User.where('is_owner = false').sample, animal: Animal.all.sample }

[reservation1, reservation2, reservation3, reservation4].each do |attributes|
  reservation = Reservation.create!(attributes)
  puts "Created #{reservation.status}"
end

puts "Finished!"
