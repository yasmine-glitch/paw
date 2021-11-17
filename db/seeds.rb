require "open-uri"
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


puts "Cleaning database..."
Reservation.destroy_all
Animal.destroy_all
User.destroy_all


puts 'Creating users...'

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

puts "Creating animals..."
# animal1 = { name: "Wafi", age: 3, address: "20 avenue de la République", price: 50, user: User.where('is_owner = true').sample, species: "Dog", quality: "Friendly", description: "very cool dog" }
# animal2 = { name: "Marooo", age: 2, address: "35 avenue de la République", price: 22, user: User.where('is_owner = true').sample, species: "Cat", quality: "Quiet", description: "very cool cat" }
# animal3 = { name: "Wannaa", age: 5, address: "72 avenue de la République", price: 15, user: User.where('is_owner = true').sample, species: "Bird", quality: "Sassy", description: "very cool bird" }
# animal4 = { name: "Lana", age: 1, address: "2 avenue de la République", price: 62, user: User.where('is_owner = true').sample, species: "Dog", quality: "Playfull", description: "very great dog" }
animal5 = { name: "Billy", age: 1, address: "2 avenue Montaigne", price: 12, user: User.where('is_owner = true').sample, species: "Goat", quality: "Funny", description: "the goat of your life" }
animal6 = { name: "Nanny", age: 2, address: "5, Avenue Des Champs-Élysées, Paris", price: 56, user: User.where('is_owner = true').sample, species: "Goat", quality: "Handsome", description: "A beautiful goat for a beautiful garden" }
animal7 = { name: "Pan", age: 4, address: "18 rue de l'évangile", price: 7, user: User.where('is_owner = true').sample, species: "Goat", quality: "Quiet", description: "lovely goat" }
animal8 = { name: "Lambert", age: 6, address: "2 villa Adrienne Simon", price: 27, user: User.where('is_owner = true').sample, species: "Goat", quality: "Playfull", description: "I love to play with your shoes" }
url = [
      'https://images.unsplash.com/photo-1524024973431-2ad916746881?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8Z29hdHxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60',
      'https://images.unsplash.com/photo-1506076177893-89d54794ef41?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8Z29hdHxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60',
      'https://images.unsplash.com/photo-1560888126-5c13ad3f9345?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTN8fGdvYXR8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60',
      'https://images.unsplash.com/photo-1542764343-436008e87145?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NTN8fGdvYXR8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60',
]

[animal5, animal6, animal7, animal8].each_with_index do |attributes, index|
  animal = Animal.create!(attributes)
  animal.photos.attach(io: URI.open(url[index]), filename: "#{animal.name}.png", content_type: "image/png")
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
