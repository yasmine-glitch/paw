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
animal1 = { name: "Wafi", age: 1, address: "20 avenue de la République, Paris", price: 50, user: User.where('is_owner = true').sample, species: "Dog", quality: "Friendly", description: "An adorable puppy, love to play and hugg." }
animal2 = { name: "Marooo", age: 2, address: "10 rue saint maur, paris", price: 22, user: User.where('is_owner = true').sample, species: "Cat", quality: "Quiet", description: "A lucky black cat who loves witches and tricks." }
animal3 = { name: "Wannaa", age: 5, address: "56 rue Laffitte, paris", price: 1500, user: User.where('is_owner = true').sample, species: "Tiger", quality: "Sassy", description: "Very hangry tiger, do not forget to feed her otherwise she will eat you!" }
animal4 = { name: "Lana", age: 1, address: "place denfert rochereau, paris", price: 62, user: User.where('is_owner = true').sample, species: "Dog", quality: "Playfull", description: "Lana is full of joy, she loves hangit out near to montparnasse or any other trainstation. Don't forget your earplug, she snores loud ..." }
animal5 = { name: "Billy", age: 1, address: "2 avenue Montaigne", price: 12, user: User.where('is_owner = true').sample, species: "Goat", quality: "Funny", description: "The goat of your life" }
animal6 = { name: "Nanny", age: 2, address: "5, Avenue Des Champs-Élysées, Paris", price: 56, user: User.where('is_owner = true').sample, species: "Goat", quality: "Handsome", description: "A beautiful goat for a beautiful garden" }
animal7 = { name: "Pan", age: 4, address: "18 rue de l'évangile", price: 7, user: User.where('is_owner = true').sample, species: "Goat", quality: "Quiet", description: "lovely goat" }
animal8 = { name: "Lambert", age: 6, address: "2 villa Adrienne Simon", price: 27, user: User.where('is_owner = true').sample, species: "Goat", quality: "Playfull", description: "I love to play with your shoes" }
pictures_url = [['https://images.unsplash.com/photo-1561495376-dc9c7c5b8726?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8bGFicmFkb3J8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60',
                 'https://images.unsplash.com/photo-1586671267731-da2cf3ceeb80?ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8bGFicmFkb3J8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60',
                 'https://images.unsplash.com/photo-1510337550647-e84f83e341ca?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjJ8fGxhYnJhZG9yfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60',
        'https://images.unsplash.com/photo-1525105087384-cb271c5563d8?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzR8fGxhYnJhZG9yJTIwcHVwcHl8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60',
        'https://images.unsplash.com/photo-1514328525431-eac296c01d82?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mjd8fGxhYnJhZG9yJTIwcHVwcHklMjBwbGF5fGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60'],
      ['https://images.unsplash.com/photo-1584615489955-ec0a8090ac34?ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8YmxhY2slMjBjYXR8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60',
        'https://images.unsplash.com/photo-1562009910-830d74050500?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTJ8fGJsYWNrJTIwY2F0fGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60',
        'https://images.unsplash.com/photo-1590563792383-22ecfeb96a1e?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjV8fGJsYWNrJTIwY2F0fGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60',
        'https://images.unsplash.com/photo-1588783952556-0cf841feaa61?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NjV8fGJsYWNrJTIwY2F0fGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60',
        'https://images.unsplash.com/photo-1573777079746-005b9853a154?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NjN8fGJsYWNrJTIwY2F0fGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=600&q=60'],
      ['https://images.unsplash.com/photo-1551972251-12070d63502a?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8dGlnZXJ8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60',
        'https://images.unsplash.com/photo-1590767187868-b8e9ece0974b?ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8dGlnZXJ8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60',
        'https://images.unsplash.com/photo-1567360615751-58281b426a5a?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjB8fHRpZ2VyfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60',
        'https://images.unsplash.com/photo-1513714920387-b00f52df9e23?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NDd8fHRpZ2VyfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60',
        'https://images.unsplash.com/photo-1560379099-82952cae0f05?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NzN8fHRpZ2VyfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60'],
      ['https://images.unsplash.com/photo-1570314032164-6a08c8fa63d2?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8YnVsbGRvZ3xlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60',
        'https://images.unsplash.com/photo-1546201483-a0fa9e5ed258?ixid=MnwxMjA3fDB8MHxzZWFyY2h8N3x8YnVsbGRvZ3xlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60',
        'https://images.unsplash.com/photo-1552764307-1d8e1febc0e6?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTF8fGJ1bGxkb2d8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60',
        'https://images.unsplash.com/photo-1604186838347-9faaf0b83be8?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTd8fGJ1bGxkb2d8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60',
        'https://images.unsplash.com/photo-1510621785963-8c1744b6a8c5?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjB8fGJ1bGxkb2d8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60'],
      ['https://images.unsplash.com/photo-1524024973431-2ad916746881?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8d2hpdGUlMjBnb2F0fGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60',
        'https://images.unsplash.com/photo-1560888126-5c13ad3f9345?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8d2hpdGUlMjBnb2F0fGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60',
        'https://images.unsplash.com/photo-1546526474-994e58e29ff3?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTh8fHdoaXRlJTIwZ29hdHxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60',
        'https://images.unsplash.com/photo-1628030028940-0d46c8cc59e3?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjJ8fHdoaXRlJTIwZ29hdHxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60',
        'https://images.unsplash.com/photo-1531646755923-93c637751b1c?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzN8fHdoaXRlJTIwZ29hdHxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60'],
      ['https://images.unsplash.com/photo-1567565932624-df6796fd9342?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTl8fGJyb3duJTIwZ29hdHxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60',
        'https://images.unsplash.com/photo-1618725586153-70136c906fb6?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjZ8fGJyb3duJTIwZ29hdHxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60',
        'https://images.unsplash.com/photo-1633514900690-071320ee9f3f?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mzd8fGJyb3duJTIwZ29hdHxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60',
        'https://images.unsplash.com/photo-1633695247960-4e140c8a3d3a?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NjR8fGJyb3duJTIwZ29hdHxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60',
        'https://images.unsplash.com/photo-1574423886860-a27bb1814f28?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NzN8fGJyb3duJTIwZ29hdHxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60'],
      ['https://images.unsplash.com/photo-1590853379017-5dd8d2ab87f8?ixid=MnwxMjA3fDB8MHxzZWFyY2h8N3x8YmxhY2slMjBnb2F0fGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60',
        'https://images.unsplash.com/photo-1616002489817-886c35df6031?ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8YmxhY2slMjBnb2F0fGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60',
        'https://images.unsplash.com/photo-1616002489817-886c35df6031?ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8YmxhY2slMjBnb2F0fGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60',
        'https://images.unsplash.com/photo-1610705968308-fa7f5545ea25?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NDR8fGJsYWNrJTIwZ29hdHxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60',
        'https://images.unsplash.com/photo-1559660499-6716b5157a61?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NjV8fGJsYWNrJTIwZ29hdHxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60'],
      ['https://images.unsplash.com/photo-1550348579-959785e820f7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8Z29hdHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=600&q=60',
        'https://images.unsplash.com/photo-1573578160998-4f4c7b023aec?ixid=MnwxMjA3fDB8MHxzZWFyY2h8N3x8Z29hdHxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60',
        'https://images.unsplash.com/photo-1606335219805-3124944a154d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDE1fHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=600&q=60',
        'https://images.unsplash.com/photo-1630007861276-4c7c12dbc827?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjB8fGdvYXR8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60',
        'https://images.unsplash.com/photo-1506076177893-89d54794ef41?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8Z29hdHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=600&q=60']]

[animal1, animal2, animal3, animal4, animal5, animal6, animal7, animal8].each_with_index do |attributes, index|
  animal = Animal.new(attributes)
  pictures_url[index].each do |url|
    animal.photos.attach(io: URI.open(url), filename: "#{animal.name}.png", content_type: "image/png")
  end
  animal.save
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
