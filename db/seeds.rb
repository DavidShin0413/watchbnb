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
rolex = Watch.create(user_id: alex.id, name: "Rolex", style: "diver", location: "Montreal", price: 10, img_url: "https://gothelist.com/media/catalog/product/cache/image/e9c3970ab036de70892d86c6d221abfe/imp/ort/content-media-product-sources-8f021a2f-f8e0-6eba-c794-b0cb3430a98a.jpg")
omega = Watch.create(user_id: alex.id, name: "Omega", style: "diver", location: "Montreal", price: 8, img_url: "https://www.watchshopping.com/media/catalog/product/image/2/1/210.30.42.20.03.001_1575420399.jpg")
casio = Watch.create(user_id: bob.id, name: "Casio", style: "field", location: "toronto", price: 1, img_url: "https://www.mastersintime.com/pictures/casio-a158wea-1ef-a158wea-1ef-3758241.jpg")
longines = Watch.create(user_id: bob.id, name: "Longines", style: "dress", location: "Montreal", price: 6, img_url: "https://www.watchtime.com/wp-content/uploads/2016/10/conquest_550_FI-1.jpg")
iwc = Watch.create(user_id: charlie.id, name: "IWC", style: "pilot", location: "Montreal", price: 7, img_url: "https://gothelist.com/media/catalog/product/cache/image/e9c3970ab036de70892d86c6d221abfe/imp/ort/content-media-product-sources-8db432eb-cddf-f5e3-d5dd-dcaecdf1cab5.jpg")
ap = Watch.create(user_id: daniel.id, name: "Audemars Piguet", style: "dress", location: "Montreal", price: 100, img_url: "https://gothelist.com/media/catalog/product/cache/image/e9c3970ab036de70892d86c6d221abfe/imp/ort/content-media-product-sources-bbe5a499-949d-42d8-86e2-155bfe039737.jpg")

# rolex.user = alex
# omega.user = alex
# casio.user = bob
# longines.user = bob
# iwc.user = charlie
# ap.user = daniel

puts "Creating bookings..."

nov16_booking = Booking.create(user_id: ethan.id, watch_id: rolex.id, start_date: Date.current, end_date: (Date.current + 1), accepted: true)


puts "Done seeding!"
