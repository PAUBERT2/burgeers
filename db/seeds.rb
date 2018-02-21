# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "destroying orders..."
Order.destroy_all

puts "destroying burgers..."
Burger.destroy_all

puts "destroying users..."
User.destroy_all


10.times do |y|
  puts "Creating User n°#{y+1}..."
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
  puts "Creating Burger n°#{i+1}..."
  burger = Burger.new(
    name: Faker::Name.first_name,
    description: Faker::Lorem.word,
    price: (50..150).to_a.sample/10,
    quantity_max: (1..10).to_a.sample,
    opening_days: Burger::WEEK_DAYS.sample,
    user: User.where(cooker:true).sample
    )
  burger.save!
  3.times do |y|
    puts "Creating Order n°#{y+1}..."
    order = Order.new(
      burger: burger,
      user: User.all.reject{|user| user == burger.user}.sample,
      quantity: burger.quantity_max,
      total_price: burger.quantity_max * burger.price
      )
    order.save!
  end

end

# 10.times do |i|
#   puts "Creating Order n°#{i}..."
#   order = Order.new(
#     burger: Burger.all.sample,
#     user: User.all.sample,
#     quantity: (1..10).to_a.sample
#     total_price: order.quantity * ( (50..150).to_a.sample/10 )
#     )
#   order.save
# end

puts 'Finished with great success !!!'
