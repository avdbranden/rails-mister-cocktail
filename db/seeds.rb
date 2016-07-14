# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Cocktail.destroy_all
10.times do
  cocktail = Cocktail.new({
    name: Faker::Company.buzzword
    })
  cocktail.save
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

