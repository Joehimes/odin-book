# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do
    user = User.create(email: Faker::Internet.email, password: "password", password_confirmation: "password")
    user.save
    profile = user.build_profile(name: Faker::Name.name, location: Faker::Address.city, age: Faker::Number.between(13, 100))
    profile.save
end

user = User.create(email: "joe@email.com", password: "password", password_confirmation: "password")
user.save
profile = user.build_profile(name: "Joe Himes", location: "Columbus", age: 37)
profile.save