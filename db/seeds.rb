puts "Cleaning database..."
User.destroy_all
Watch.destroy_all
Booking.destroy_all

puts "Creating users..."
alex = User.create!(name: 'Alex', email: "a@a.a", password: "123456")
bob = User.create!(name: 'Bob', email: "b@b.b", password: "123456")
charlie = User.create!(name: 'Charlie', email: "c@c.c", password: "123456")

puts "Creating watches..."
rolex = Watch.create(user_id: alex.id, name: "Rolex", style: "Diver", location: "Montreal", price: 100, img_url: "https://gothelist.com/media/catalog/product/cache/image/e9c3970ab036de70892d86c6d221abfe/imp/ort/content-media-product-sources-8f021a2f-f8e0-6eba-c794-b0cb3430a98a.jpg")
omega = Watch.create(user_id: alex.id, name: "Omega", style: "Diver", location: "Montreal", price: 50, img_url: "https://www.watchshopping.com/media/catalog/product/image/2/1/210.30.42.20.03.001_1575420399.jpg")
casio = Watch.create(user_id: alex.id, name: "Casio", style: "Field", location: "Toronto", price: 90, img_url: "https://www.mastersintime.com/pictures/casio-a158wea-1ef-a158wea-1ef-3758241.jpg")
longines = Watch.create(user_id: alex.id, name: "Longines", style: "Dress", location: "Chicoutimi", price: 75, img_url: "https://www.watchtime.com/wp-content/uploads/2016/10/conquest_550_FI-1.jpg")
iwc = Watch.create(user_id: charlie.id, name: "IWC", style: "Pilot", location: "Montreal", price: 50, img_url: "https://gothelist.com/media/catalog/product/cache/image/e9c3970ab036de70892d86c6d221abfe/imp/ort/content-media-product-sources-8db432eb-cddf-f5e3-d5dd-dcaecdf1cab5.jpg")
ap = Watch.create(user_id: charlie.id, name: "Audemars Piguet", style: "Dress", location: "New York", price: 100, img_url: "https://gothelist.com/media/catalog/product/cache/image/e9c3970ab036de70892d86c6d221abfe/imp/ort/content-media-product-sources-bbe5a499-949d-42d8-86e2-155bfe039737.jpg")

puts "Creating bookings..."
booking1 = Booking.create(user_id: bob.id, watch_id: rolex.id, start_date: Date.current, end_date: (Date.current + 1), accepted: true)
booking2 = Booking.create(user_id: bob.id, watch_id: omega.id, start_date: Date.current, end_date: (Date.current + 1), accepted: true)
booking3 = Booking.create(user_id: bob.id, watch_id: casio.id, start_date: Date.current, end_date: (Date.current + 1), accepted: false)
booking5 = Booking.create(user_id: alex.id, watch_id: iwc.id, start_date: Date.current, end_date: (Date.current + 1), accepted: true)
booking6 = Booking.create(user_id: alex.id, watch_id: ap.id, start_date: Date.current, end_date: (Date.current + 1), accepted: false)

puts "Done seeding!"
