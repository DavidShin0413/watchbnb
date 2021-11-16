# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Cleaning database"
User.destroy_all
Watch.destroy_all
Booking.destroy_all

puts "Creating users..."
alex = User.create!(email: "a@a.a", password: "123456")
bob = User.create!(email: "b@b.b", password: "123456")
charlie = User.create!(email: "c@c.c", password: "123456")
daniel = User.create!(email: "d@d.d", password: "123456")
ethan = User.create!(email: "e@e.e", password: "123456")

puts "Creating watches..."
rolex = Watch.create(user_id: alex.id, name: "Rolex", style: "diver", location: "Montreal", price: 10, img_url: "https://source.unsplash.com/random/300x300")
omega = Watch.create(user_id: alex.id, name: "Omega", style: "diver", location: "Montreal", price: 8, img_url: "https://source.unsplash.com/random/300x300")
casio = Watch.create(user_id: bob.id, name: "Casio", style: "field", location: "toronto", price: 1, img_url: "https://source.unsplash.com/random/300x300")
longines = Watch.create(user_id: bob.id, name: "Longines", style: "dress", location: "Montreal", price: 6, img_url: "https://source.unsplash.com/random/300x300")
iwc = Watch.create(user_id: charlie.id, name: "IWC", style: "pilot", location: "Montreal", price: 7, img_url: "https://source.unsplash.com/random/300x300")
ap = Watch.create(user_id: daniel.id, name: "Audemars Piguet", style: "dress", location: "Montreal", price: 100, img_url: "https://source.unsplash.com/random/300x30")

# rolex.user = alex
# omega.user = alex
# casio.user = bob
# longines.user = bob
# iwc.user = charlie
# ap.user = daniel

puts "Creating bookings..."

nov16_booking = Booking.create(user_id: ethan.id, watch_id: rolex.id, start_date: Date.current, end_date: (Date.current + 1), accepted: true)


puts "Done seeding!"
