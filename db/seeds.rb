require 'nokogiri'
require 'open-uri'
require 'faker'

url     = "http://www.1001cocktails.com/cocktails/recettes-popularite-0.html"
doc     = Nokogiri::HTML(open(url), nil, 'utf-8')
results =  doc.css('#content a[style="font-weight:bold"]')
Cocktail.destroy_all
results.each do |cocktail_name|
  results.count.times do
    cocktail = Cocktail.new({
      name: cocktail_name.text,
      picture: "mojito.jpg"
      })
    cocktail.save
  end
end

Ingredient.destroy_all
ingredients = %w(lemon cinammon sugar ice water whisky vodka orange apple)
ingredients.size.times do
  ingredient = Ingredient.new({
    name: ingredients.pop
    })
  ingredient.save
end

Dose.destroy_all
20.times do
  dose = Dose.new({
    description: Faker::Lorem.word,
    cocktail_id: (1..10).to_a.sample,
    ingredient_id: (1..9).to_a.sample
    })
  dose.save
end

