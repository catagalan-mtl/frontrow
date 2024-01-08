puts "creatting attendances for Queens of the Stone Age"
queens = Artist.find_by(name: "Queens of the Stone Age")
queens_concert = Concert.find_by(artist_id: queens.id, city: "Montreal")

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
