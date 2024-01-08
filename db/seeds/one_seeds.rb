require "open-uri"
require "json"
require "rest-client"
require_relative "users"

puts "Cleaning the messages table"
Message.destroy_all
puts "Cleaning the chatrooms table"
Chatroom.destroy_all
puts "Cleaning the comments table"
Comment.destroy_all
puts "Cleaning the reviews table"
Review.destroy_all
puts "Cleaning the attendances table"
Attendance.destroy_all
puts "Cleaning the concerts table"
Concert.destroy_all
puts "Cleaning the artist table"
Artist.destroy_all
puts "Cleaning the users table."
User.destroy_all

bands = [{ name: 'Jinjer', url: '51b37017-859c-465e-8810-2d2dd41a401e',
  banner_url: "https://lh3.googleusercontent.com/JHv-Y2zO-hqxL-Zd7mPn-x3su5Vo-tiGo65rd5j2t1Wn2wOEbf8V-xjezTlsIg0EE8JWP6fanpKX7g=w1350-h562-p-l90-rj",
  photo_url: "https://static.tildacdn.com/tild3966-6563-4136-b133-616464643138/Desktop.jpg" },
{ name: 'Metallica', url: '65f4f0c5-ef9e-490c-aee3-909e7ae6b2ab',
  banner_url: "https://www.punkrocktheory.com/sites/default/files/styles/image_style_huge_horizontal_rectangle/public/thegaslightanthem_0.jpg?itok=LwA_CX8y",
  photo_url: "https://www.revolvermag.com/sites/default/files/styles/image_750_x_420/public/media/images/article/metallica_saccenti_1600x900.png?itok=YkFGj72K&timestamp=1680641758" },
{ name: 'Olivia Rodrigo', url: '6925db17-f35e-42f3-a4eb-84ee6bf5d4b0',
  banner_url: "https://www.dexerto.com/cdn-cgi/image/width=1920,quality=75,format=auto/https://editors.dexerto.com/wp-content/uploads/2023/06/27/fans-upset-olivia-rodrigo-guts-album-cover-1.jpg",
  photo_url: "https://evenko.ca/_uploads/event/57045/splash.jpg?v=1694617788"},
{ name: 'Machine Head', url: '22a1f4d7-81ff-4216-ac06-3387da6bc118',
  banner_url: "https://www.worshipmetal.com/wp-content/uploads/2017/11/Machine-Head-banner.jpg",
  photo_url: "https://evenko.ca/_uploads/event/58004/splash.jpg?v=1697637950"},
{ name: 'Jacob Collier', url: '1df15ee0-b52b-4315-9cb9-bc5a27a685e9',
  banner_url: "https://repo.thewildcity.com/3017-jacob-collier-banner.jpg",
  photo_url: "https://media.npr.org/assets/img/2016/07/11/jacob-collier2-18a5864435ce79a0416b9095b82d34f70f2dcdb4.jpg"},
{ name: 'Half Moon Run', url: 'b48e0b4e-587b-4fb4-9706-78dfd1a5ea92',
  banner_url: "https://thecbpshop.com/cdn/shop/files/HMR_BannerV0-06_a1c13a20-13f2-4839-9817-86e84bbfddf2_1600x.png?v=1677267615",
  photo_url: "https://s1.ticketm.net/dam/a/1d5/7c868895-42e3-4230-b86d-97d82ec971d5_EVENT_DETAIL_PAGE_16_9.jpg"},
{ name: 'Excision', url: '733c6e6f-0306-403e-9243-82b16a4f82d8',
  banner_url: "https://i.imgur.com/DUD3H8jg.jpg",
  photo_url: "https://www.evenko.ca/_uploads/event/56884/splash.jpg?v=1693579940"},
{ name: 'Tool', url: '66fc5bf8-daa4-4241-b378-9bc9077939d2',
  banner_url: "https://media.pitchfork.com/photos/6151d4465f20b295d9d2c2a0/2:1/w_2560%2Cc_limit/Tool.jpg",
  photo_url: "https://media.pitchfork.com/photos/6151d4465f20b295d9d2c2a0/2:1/w_2560%2Cc_limit/Tool.jpg" },
  { name: 'Tim McGraw', url: '7e5cfc9a-e9e1-46f1-b81a-861b12049488',
    banner_url: "https://flyctory.com/wp-content/uploads/2023/08/Tim-McGraw-Standing-Room-Only-BANNER.jpg",
    photo_url: "https://s1.ticketm.net/dam/a/1ef/15547dcf-f110-4c52-b05d-bc946bbcd1ef_RETINA_PORTRAIT_3_2.jpg"},
  { name: 'Armin Van Buuren', url: '477b8c0c-c5fc-4ad2-b5b2-191f0bf2a9df',
    banner_url: "https://cdn-az.allevents.in/events1/banners/3bfae3aaebe016ab8aaa0da2c4055fe16d1d3e4dbb9ea63cc8a83d51d8afcd11-rimg-w960-h540-gmir.jpg?v=1703855350",
    photo_url: "https://i.ticketweb.com/i/00/12/50/51/88_Edp.jpg?v=43"},
  { name: 'Queens of the Stone Age', url: '7dc8f5bd-9d0b-4087-9f73-dc164950bbd8',
    banner_url: "https://lh3.googleusercontent.com/zm23SXI20lpXbZWpkwUxkdHWwe-0m7Bzz5vTmytnpsVcftkg-uwrtXGigDB5AQh5Rml_XfAf03oUDEI=w2880-h1200-p-l90-rj",
    photo_url: "https://gi-media.s3.eu-west-2.amazonaws.com/wp-content/uploads/2020/08/14192253/qotsa1.jpg"},
  { name: 'Sarah McLachlan', url: 'ce58d854-7430-4231-aa44-97f0144b3372',
    banner_url: "https://res.cloudinary.com/dwzhqvxaz/image/upload/c_pad,w_1800,ar_3,q_auto,f_auto,b_auto/umbraco-prod/lbkdkpk0/static_digital-webbanner_1800x600_sarahmclachlan_2024_regional_smartfinancialcentreatsugarland_0706.jpg",
    photo_url: "https://evenko.ca/_uploads/event/59796/splash.jpg?v=1702398953"}]

bands.each do |band|
  sleep(3)
  puts "Creating the artist #{band[:name]}"
  artist = Artist.create(name: "#{band[:name]}")
  photo = URI.open(band[:photo_url])
  banner = URI.open(band[:banner_url])
  artist.photo.attach(io: photo, filename: "band_photo.png", content_type: "image/png")
  artist.banner.attach(io: banner, filename: "band_banner.png", content_type: "image/png")
  artist.save!
  puts "Creating concerts for #{band[:name]}"

  url = "https://api.setlist.fm/rest/1.0/artist/#{band[:url]}/setlists"

  response = RestClient.get(url, { 'Accept': 'application/json', 'x-api-key': ENV['SETLIST_API_KEY'] })
  shows = JSON.parse(response)

  shows["setlist"].each do |show|
    concert = Concert.new
    concert.city = show["venue"]["city"]["name"]
    concert.venue = show["venue"]["name"]
    concert.date = show["eventDate"]
    concert.artist_id = artist.id
    concert.save!
    puts "Created new concert with id #{concert.id} for #{band[:name]}"
  end
end


puts "creating users seeds Bowie, Paloma and us"

default_avatar_url = "https://hips.hearstapps.com/hmg-prod/images/sigourney-weaver-avatar-ii-the-way-of-water-1670323174.jpg?crop=0.500xw:0.949xh;0.299xw,0.0514xh&resize=1200:*"
default_banner_url = "https://townsquare.media/site/62/files/2021/11/attachment-brian-ruiz.jpg?w=980&q=75"
default_password = "123456"
default_city = "Montreal"


USERS.each do |user_hash|
  new_user = User.new(
    username: user_hash[:username],
    age: user_hash[:age],
    bio: user_hash[:bio],
    email: user_hash[:email]
  )

  avatar = URI.open(user_hash[:avatar_url] || default_avatar_url)
  new_user.avatar.attach(io: avatar, filename: "avatar.png", content_type: "image/png")
  banner = URI.open(user_hash[:banner_url] || default_banner_url)
  new_user.banner.attach(io: banner, filename: "banner.png", content_type: "image/png")

  new_user.city = user_hash[:city] || default_city
  new_user.password = default_password unless user_hash[:password]
  new_user.save!
end

puts "Done!!!"

puts "creating seed bowie attendance"
bowies_concert = Concert.find_by(date: "Thu, 14 Sep 2023 00:00:00.000000000 UTC +00:00")
bowie = User.find_by(username: "Bowie")
Attendance.create!(user: bowie, concert: bowies_concert)
puts "done!"

puts "creating seed cat attendance"
cats_concert = Concert.find_by(date: "Thu, 14 Sep 2023 00:00:00.000000000 UTC +00:00")
cat = User.find_by(username: "Cat")
Attendance.create!(user: cat, concert: cats_concert)
puts "done!"

puts "creating seed antoine attendance"
antoines_concert = Concert.find_by(date: "Thu, 14 Sep 2023 00:00:00.000000000 UTC +00:00")
antoine = User.find_by(username: "Antoine")
Attendance.create!(user: antoine, concert: antoines_concert)
puts "done!"

puts "creating seed sofia attendance"
sofias_concert = Concert.find_by(date: "Thu, 14 Sep 2023 00:00:00.000000000 UTC +00:00")
sofia = User.find_by(username: "Sofia")
Attendance.create!(user: sofia, concert: sofias_concert)
puts "done!"

puts "creating seed doga attendance"
dogas_concert = Concert.find_by(date: "Thu, 14 Sep 2023 00:00:00.000000000 UTC +00:00")
doga = User.find_by(username: "Doga")
Attendance.create!(user: doga, concert: dogas_concert)
puts "done!"


puts "seed writing cats review"
cats_review = Review.new(
  rating: 5,
  content: "WHAT AN INCREDIBLE SHOW!!!!!! I was lucky to be right by the stage, check it out!",
  attendance: Attendance.find_by(user: cat)
)
cats_review.photos.attach(io: URI.open("https://voir.ca/voir-content/blogs.dir/254/files/2019/10/jinjer_voir-29.jpg"),
filename: "conert_photo_1", content_type: "image/png")


cats_review.save!
puts "done!"

puts "seed writing bowies review"
bowies_review = Review.new(
  rating: 5,
  content: "What an incredible show! I'm blown away. If you get the chance, this is a MUST SEE",
  attendance: Attendance.find_by(user: bowie)
)

bowies_review.save!
puts "done!"

puts "seed writing antoines review"
antoines_review = Review.new(
  rating: 5,
  content: "Amazeballs!!!!!!",
  attendance: Attendance.find_by(user: antoine)
)
antoines_review.photos.attach(io: URI.open("https://images.squarespace-cdn.com/content/v1/56f86ab5cf80a11b0082c9d4/1569784614188-CWCA330KDP4GSLAJ3E1S/Jinjer+Sep+21+2019+RRB.jpg"),
                          filename: "conert_photo_1", content_type: "image/png")

antoines_review.save!
puts "done!"

puts "seed writing sofias review"
sofias_review = Review.new(
  rating: 3,
  content: "I think I like Nickelback better, I should have gone to that one instead. Still fun though.",
  attendance: Attendance.find_by(user: sofia)
)
sofias_review.photos.attach(io: URI.open("https://media.istockphoto.com/id/690220340/video/selfiestick-in-concert-crowd.jpg?s=640x640&k=20&c=tLgtOmFIBKfvzWRDEDJhnSVczlTHcjqK25WnFZuME0Q="),
                          filename: "conert_photo_1", content_type: "image/png")

sofias_review.save!
puts "done!"

puts "seed writing doga review"
doga_review = Review.new(
  rating: 5,
  content: "You just had to be there",
  attendance: Attendance.find_by(user: doga)
)
doga_review.photos.attach(io: URI.open("https://i0.wp.com/ghostcultmag.com/wp-content/uploads/Jinjer-6-2022-RaginRosie-Photography.jpg?fit=1064%2C739&ssl=1"),
                          filename: "conert_photo_1", content_type: "image/png")


doga_review.save!
puts "done!"

puts "seed commenting on review"
Comment.create!(content: "I agree!!!! We are lucky we got to see that!", user: User.last, review: Review.first)
puts "all done!"
