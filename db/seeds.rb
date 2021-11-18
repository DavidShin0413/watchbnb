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
booking1 = Booking.create(user_id: bob.id, watch_id: rolex.id, start_date: (Date.current + 1), end_date: (Date.current + 2), status: 0)
booking2 = Booking.create(user_id: bob.id, watch_id: omega.id, start_date: (Date.current + 3), end_date: (Date.current + 4), status: 0)
booking3 = Booking.create(user_id: bob.id, watch_id: casio.id, start_date: (Date.current + 5), end_date: (Date.current + 6), status: 0)
booking4 = Booking.create(user_id: bob.id, watch_id: casio.id, start_date: (Date.current + 7), end_date: (Date.current + 8), status: 0)
booking5 = Booking.create(user_id: bob.id, watch_id: casio.id, start_date: (Date.current + 9), end_date: (Date.current + 10), status: 0)
booking6 = Booking.create(user_id: bob.id, watch_id: casio.id, start_date: (Date.current + 11), end_date: (Date.current + 12), status: 1)
booking7 = Booking.create(user_id: alex.id, watch_id: iwc.id, start_date: (Date.current + 13), end_date: (Date.current + 14), status: 0)
booking8 = Booking.create(user_id: alex.id, watch_id: ap.id, start_date: (Date.current + 15), end_date: (Date.current + 16), status: 1)
booking9 = Booking.create(user_id: alex.id, watch_id: ap.id, start_date: (Date.current + 17), end_date: (Date.current + 18), status: 1)
booking10 = Booking.create(user_id: alex.id, watch_id: ap.id, start_date: (Date.current + 19), end_date: (Date.current + 20), status: 1)
booking11 = Booking.create(user_id: alex.id, watch_id: ap.id, start_date: (Date.current + 21), end_date: (Date.current + 22), status: 1)
booking12 = Booking.create(user_id: alex.id, watch_id: ap.id, start_date: (Date.current + 23), end_date: (Date.current + 24), status: 2)

puts "Done seeding!"
