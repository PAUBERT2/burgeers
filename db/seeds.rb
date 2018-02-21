# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "destroying burgers..."
Burger.destroy_all

puts "destroying users..."
User.destroy_all


10.times do |y|
  puts "Creating User n°#{y}..."
  user = User.new(
    email: Faker::Internet.email,
    password: 'lewagon',
    last_name: Faker::Name.first_name,
    first_name: Faker::Name.last_name,
    cooker: [true, false].sample
    )
  user.save
end

10.times do |i|
  puts "Creating Burger n°#{i}..."
  b = Burger.new(
      name: Faker::Pokemon.name,
      description: Faker::Lorem.word,
      price: (50..150).to_a.sample/10,
      quantity_max: (1..10).to_a.sample,
      opening_days: Burger::WEEK_DAYS.sample,
      user: User.where(cooker:true).sample
      )
  b.save
end

puts 'Finished with great success !!!'
