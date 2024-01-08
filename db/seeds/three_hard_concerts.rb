puts "Hard coding Vancouver shows..."
artist = Artist.create(name: "boygenius")
photo = URI.open("https://assets-global.website-files.com/60444c8a09ebdbe635864d58/64223261393986b271bae894_boygenius---press-photo-new.jpg")
artist.photo.attach(io: photo, filename: "band_photo.png", content_type: "image/png")
banner = URI.open("https://m.media-amazon.com/images/I/81+oTyZWkiL._UF1000,1000_QL80_.jpg")
artist.banner.attach(io: banner, filename: "band_banner.png", content_type: "image/png")
concert = Concert.new
concert.city = "Vancouver"
concert.venue = "PNE Amphitheatre"
concert.date = Date.new(2023, 07, 27)
concert.tickets_url = ""
concert.artist_id = artist.id
concert.save!

artist = Artist.create(name: "Muse")
photo = URI.open("https://dwu32cgxelq1c.cloudfront.net/local_newspapers/sites/117/2016/04/Muse.jpg")
artist.photo.attach(io: photo, filename: "band_photo.png", content_type: "image/png")
banner = URI.open("https://media.wmg-is.com/media/portal/media/cms/images/200804/muse-artist-banner-extralarge_1208856877155.jpg")
artist.banner.attach(io: banner, filename: "band_banner.png", content_type: "image/png")
concert = Concert.new
concert.city = "Vancouver"
concert.venue = "Rogers Arena"
concert.date = Date.new(2023, 11, 05)
concert.tickets_url = ""
concert.artist_id = artist.id
concert.save!

artist = Artist.create(name: "The National")
photo = URI.open("https://i.guim.co.uk/img/media/6e9324e8e0fc7ee95ab6d9ad3f4855973a140adb/0_13_6720_4032/master/6720.jpg?width=1200&height=1200&quality=85&auto=format&fit=crop&s=3b527331203d3cbff6bdc23d21b7090c")
artist.photo.attach(io: photo, filename: "band_photo.png", content_type: "image/png")
banner = URI.open("https://static01.nyt.com/images/2019/05/22/arts/22national-promo/merlin_155143842_e41b6019-8eac-4f44-b127-df25ef92a539-superJumbo.jpg")
artist.banner.attach(io: banner, filename: "band_banner.png", content_type: "image/png")
concert = Concert.new
concert.city = "Vancouver"
concert.venue = "Commodore Ballroom"
concert.date = Date.new(2023, 10, 11)
concert.tickets_url = ""
concert.artist_id = artist.id
concert.save!

puts "Hard coding Montreal concerts..."

artist = Artist.create(name: "Gojira")
photo = URI.open("https://i.scdn.co/image/ab6761610000e5eb96c4949ee078fbef5d5adb68")
artist.photo.attach(io: photo, filename: "band_photo.png", content_type: "image/png")
banner = URI.open("https://metalinsider.net/site/wp-content/uploads/2023/05/gojira-sun-cove-boca-raton-2023-05-04-20.jpg")
artist.banner.attach(io: banner, filename: "band_banner.png", content_type: "image/png")
concert = Concert.new
concert.city = "Montreal"
concert.venue = "Place Bell"
concert.date = Date.new(2023, 8, 18)
concert.tickets_url = "https://www.ticketmaster.ca/the-megamonsters-tour-gojira-and-mastodon-laval-quebec-08-18-2023/event/31005E2D8ABA2215"
concert.artist_id = artist.id
concert.save!

puts "Created Gojira concert"

artist = Artist.create(name: "Tegan & Sara")
photo = URI.open("https://www.rollingstone.com/wp-content/uploads/2022/10/TS_ICGU_Press-Photo_Crop-FINAL.jpg?w=1581&h=1054&crop=1")
artist.photo.attach(io: photo, filename: "band_photo.png", content_type: "image/png")
banner = URI.open("https://images.squarespace-cdn.com/content/v1/582601b4440243fc471a91d0/1589936427914-K2JGGEEA8BFPW1QJDU85/TeganAndSara-rainbow.jpg")
artist.banner.attach(io: banner, filename: "band_banner.png", content_type: "image/png")
concert = Concert.new
concert.city = "Montreal"
concert.venue = "L'Olympia"
concert.date = Date.new(2023, 06, 14)
concert.tickets_url = "https://www.ticketmaster.ca/event/31005E6327A28F7D?lang=en-ca&brand=lolympia&irgwc=1&clickid=w0iQP30LCxyPR5lTCnwEzVSsUkFx0k3%3AP1tax40&camefrom=CFC_BUYAT_219208&impradid=219208&REFERRAL_ID=tmfeedbuyat219208&wt.mc_id=aff_BUYAT_219208&utm_source=219208-Bandsintown&impradname=Bandsintown&utm_medium=affiliate&ircid=4272"
concert.artist_id = artist.id
concert.save!

puts "Created Tegan and Sara concert"

artist = Artist.create(name: "The Cure")
photo = URI.open("https://cdn.maximonline.ru/a6/69/c0/a669c0cfa8761c1adbf992c369c80e22/665x554_0xac120005_6630441991529055584.jpg")
artist.photo.attach(io: photo, filename: "band_photo.png", content_type: "image/png")
banner = URI.open("https://media.pitchfork.com/photos/62e296a7340482e142b25509/16:9/w_1280,c_limit/The-Cure.jpg")
artist.banner.attach(io: banner, filename: "band_banner.png", content_type: "image/png")
concert = Concert.new
concert.city = "Montreal"
concert.venue = "Bell Centre"
concert.date = Date.new(2023, 06, 17)
concert.tickets_url = "https://verifiedfan.ticketmaster.com/thecure2023?irgwc=1&clickid=w0iQP30LCxyPR5lTCnwEzVSsUkFx0kROP1tax40&camefrom=CFC_BUYAT_219208&impradid=219208&REFERRAL_ID=tmfeedbuyat219208&wt.mc_id=aff_BUYAT_219208&utm_source=219208-Bandsintown&impradname=Bandsintown&utm_medium=affiliate&ircid=4272"
concert.artist_id = artist.id
concert.save!

puts "Created The Cure concert"

puts "hard coding Springsteen concert"

artist = Artist.create(name: "Bruce Springsteen")
photo = URI.open("https://d2cx26qpfwuhvu.cloudfront.net/millstad/wp-content/uploads/2023/10/30114553/BruceSpringsteen-cardiff-events-page-1170x660-1.jpg")
artist.photo.attach(io: photo, filename: "band_photo.png", content_type: "image/png")
banner = URI.open("https://lh3.googleusercontent.com/FlGMAmU7bl8Kp_alZdOwXfkOr2f5KHc9rqCAYOjjHnJwixi3hBwn_ALMIp11N_KcmX3ensQp7lN63K0=w2880-h1200-p-l90-rj")
artist.banner.attach(io: banner, filename: "band_banner.png", content_type: "image/png")
concert = Concert.new
concert.city = "Montreal"
concert.venue = "Bell Centre"
concert.date = Date.new(2023, 11, 20)
concert.tickets_url = "https://www.ticketmaster.ca/bruce-springsteen-and-the-e-street-montreal-quebec-11-20-2023/event/31005E4CA5A51ACF?irgwc=1&clickid=w0iQP30LCxyPR5lTCnwEzVSsUkFx0kTuP1tax40&camefrom=CFC_BUYAT_219208&impradid=219208&REFERRAL_ID=tmfeedbuyat219208&wt.mc_id=aff_BUYAT_219208&utm_source=219208-Bandsintown&impradname=Bandsintown&utm_medium=affiliate&ircid=4272"
concert.artist_id = artist.id
concert.save!

puts "Created Springsteen concert"

artist = Artist.find_by(name: "Tool")
concert = Concert.new
concert.city = "Chicago"
concert.venue = "Stadium"
concert.date = Date.new(2023, 05, 20)
concert.tickets_url = ""
concert.artist_id = artist.id
concert.save!

puts "Created Tool Chicago concert"
