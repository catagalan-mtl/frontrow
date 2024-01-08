puts "creatting attendances for Bruce Springsteen"
bruce = Artist.find_by(name: "Bruce Springsteen")
bruce_concert = Concert.find_by(artist_id: bruce.id, venue: "Bell Centre")

puts "creating seed cat attendance"
cat = User.find_by(username: "Cat")
Attendance.create!(user: cat, concert: bruce_concert)
puts "done!"

puts "creating attendances for Bruce"
users = User.where.not(username: "Cat").where.not(username: "Kirstin").all
users.first(15).each do |user|
  puts "creating seed #{user.username} attendance"
  Attendance.create!(user: user, concert: bruce_concert)
end
puts "done!"

puts "creatting attendances for Queens of the Stone Age"
queens = Artist.find_by(name: "Queens of the Stone Age")
queens_concert = Concert.find_by(artist_id: queens.id, venue: "Bell Centre")

puts "creating seed cat attendance"
cat = User.find_by(username: "Cat")
Attendance.create!(user: cat, concert: queens_concert)
puts "done!"

puts "creating attendances for Queens"
users = User.where.not(username: "Cat").where.not(username: "Kirstin").all
users.first(15).each do |user|
  puts "creating seed #{user.username} attendance"
  Attendance.create!(user: user, concert: queens_concert)
end
puts "done!"

puts "creating attendances to Tegan and Sara"
t_and_s_concert = Concert.find_by(venue: "L'Olympia")

puts "creating bowies attendance"
bowie = User.find_by(username: "Bowie")
Attendance.create!(user: bowie, concert: t_and_s_concert)
puts "done!"

puts "creating seed cat attendance"
cat = User.find_by(username: "Cat")
Attendance.create!(user: cat, concert: t_and_s_concert)
puts "done!"

puts "creating seed antoine attendance"
antoine = User.find_by(username: "Antoine")
Attendance.create!(user: antoine, concert: t_and_s_concert)
puts "done!"

puts "creating seed doga attendance"
doga = User.find_by(username: "Doga")
Attendance.create!(user: doga, concert: t_and_s_concert)
puts "done!"

puts "creating sofia's attendances"
sofia = User.find_by(username: "Sofia")
Attendance.create!(user: sofia, concert: t_and_s_concert)
puts "done!"

the_cure = Artist.find_by(name: "The Cure")
the_cure_concert = Concert.find_by(artist_id: the_cure.id, venue: "Bell Centre")
sofia = User.find_by(username: "Sofia")
Attendance.create!(user: sofia, concert: the_cure_concert)
puts "done!"

# louise = Artist.find_by(name: "Louise Attaque")
# louise_concert = Concert.find_by(artist_id: louise.id, city: "Paris")
# sofia = User.find_by(username: "Sofia")
# Attendance.create!(user: sofia, concert: louise_concert)
# puts "done!"

tool = Artist.find_by(name: "Tool")
tool_concert = Concert.find_by(artist_id: tool.id, city: "Chicago")
sofia = User.find_by(username: "Sofia")
Attendance.create!(user: sofia, concert: tool_concert)
puts "done!"

puts "creating cat's attendance to Tool"
tool = Artist.find_by(name: "Tool")
tool_concert = Concert.find_by(artist_id: tool.id, city: "Chicago")
cat = User.find_by(username: "Cat")
Attendance.create!(user: cat, concert: tool_concert)
puts "done!"


puts "creatting attendances for Gojira"
gojira = Artist.find_by(name: "Gojira")
gojira_concert = Concert.find_by(artist_id: gojira.id, venue: "Place Bell")

puts "creating seed Cat attendance"
cat = User.find_by(username: "Cat")
Attendance.create!(user: cat, concert: gojira_concert)
puts "done!"

puts "creating seed Stephane attendance"
stephane = User.find_by(username: "Stephane")
Attendance.create!(user: stephane, concert: gojira_concert)
puts "done!"

puts "creating seed Ines attendance"
ines = User.find_by(username: "Ines")
Attendance.create!(user: ines, concert: gojira_concert)
puts "done!"

# puts "seed commenting on reviews"
# Comment.create!(content: "I agree!!!! We are lucky we got to see that!", user: User.last, review: Review.first)
# Comment.create!(content: "Gosh, I love social media.", user: cat, review: sofias_review)
# Comment.create!(content: "You're just jealous that Chad Kroeger has better hair than you.", user: sofia, review: sofias_review)
# Comment.create!(content: "Your music tastes are questionable... At best.", user: antoine, review: sofias_review)
# puts "all done!"

puts "Creating Sofia's & Cat's followers"

kirstin = User.find_by(username: "Kirstin")

all_users_but_sofia_kirstin = User.where.not(username: sofia.username).where.not(username: kirstin.username)
all_users_but_sofia_kirstin.each do |user|
  user.follow(sofia)
end

all_users_but_cat_kirstin = User.where.not(username: cat.username).where.not(username: kirstin.username).first(5)
all_users_but_cat_kirstin.each do |user|
  user.follow(cat)
end

first_10_without_sophia_kirstin = all_users_but_sofia_kirstin.first(10)
first_10_without_sophia_kirstin.each do |user|
  sofia.follow(user)
end

first_5_without_cat_kirstin = all_users_but_cat_kirstin.first(5)
first_5_without_cat_kirstin.each do |user|
  cat.follow(user)
end

puts "ALL DONE!!!!!!!!"


# artists = Artist.all
# sofia_artist = artists.where.not(name: "Tool")
# sofia = User.find_by(username: "Sofia")
# sofia_artist.each do |artista|
#   sofia_concert = Concert.find_by(artist_id: artista.id)
#   if sofia_concert.city == "Montreal"
#     Attendance.create!(user: sofia, concert: sofia_concert)
#   end
# end
