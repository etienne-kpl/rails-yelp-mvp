# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

Restaurant.destroy_all
Review.destroy_all

10.times do
  name = Faker::Restaurant.name
  address = Faker::Address.full_address
  category = Restaurant::CATEGORIES.sample
  restaurant = Restaurant.create(name:, address:, category:)
  3..10.times do
    content = Faker::Restaurant.review
    rating = rand(5)
    restaurant_id = restaurant.id
    Review.create(content:, rating:, restaurant_id:)
  end
end
