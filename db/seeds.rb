# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# User.create(email:'i@gmail.com', password:12345678)
# User.create(email:'n@gmail.com', password:12345678)


require 'faker'

# 5.times do
# User.create(email:"#{Faker::Name.name}@gmail.com", password:12345678)
# end

5.times do
  User.first.posts.build(content:Faker::Movies::BackToTheFuture.quote)
  User.second.posts.build(content:Faker::Movies::BackToTheFuture.quote)
end