# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts "Deleting all users..."
User.delete_all

puts "Deleting all housings..."
Housing.delete_all

puts "Deleting all furnitures..."
Furniture.delete_all

puts "Creating users..."
for i in 0..9
  puts "Creating: " + "user" + i.to_s + "@foo.bar (password: 12345678)"
  user = User.create(email: 'user' + i.to_s + '@foo.bar',
              password: '12345678',
              password_confirmation: '12345678',
              confirmed_at: Time.now)
              
  puts "Creating housings for this user..."
  for i in (user.id * 10)..(user.id * 10 + 9)
    user.housings.create(
                   title: "Housing " + i.to_s,
                   description: "This is the description for housing " \
                   + i.to_s,
                   address: "Forbes Avenue " + i.to_s,
                   image_url: "none")
  end
  
  puts "Creating furnitures for this user..."
  for i in (user.id * 10)..(user.id * 10 + 9)
    user.furnitures.create(
                   title: "Furniture " + i.to_s,
                   description: "This is the description for furniture " \
                   + i.to_s,
                   image_url: "none")
  end
end


