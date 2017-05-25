# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Ingredient.create(name: "lemon")
# Ingredient.create(name: "ice")
# Ingredient.create(name: "mint leaves")

require 'json'
require 'open-uri'

url = 'http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
user_serialized = open(url).read
user = JSON.parse(user_serialized)
user["drinks"].each do |ingredient|
  Ingredient.create(name: ingredient["strIngredient1"])
end


require "nokogiri"

url = "http://www.gettyimages.co.uk/photos/cocktail?excludenudity=true&sort=mostpopular&mediatype=photography&phrase=cocktail"
html_file = open(url)
doc = Nokogiri::HTML(html_file)

doc.search(".asset-link").each do |drink|
  image = drink.search("img")[0].attr("src")
  name = drink.search("h3 a")[0].text
  address = drink.search(".listings_flag")[0].text.strip
  Cocktail.create!(name: name, address: address, image_url: image)
end
