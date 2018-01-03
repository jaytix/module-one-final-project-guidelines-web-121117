require_relative '../config/environment'
require 'rest-client'
require 'json'
require 'pry'


cocktails_data = RestClient.get('https://raw.githubusercontent.com/teijo/iba-cocktails/master/recipes.json')
drinks_arr = JSON.parse(cocktails_data)

# # Make a Set of unique category names
# uniq_category_names = Set.new

# Create drinks
drinks_arr.each do |drinks_arr_element|
  name = drinks_arr_element["name"]
  category = drinks_arr_element["category"]
  ingredients = drinks_arr_element["ingredients"]
  preparation = drinks_arr_element["preparation"]
  new_drink = Drink.create(name: name, category: category, preparation: preparation, ingredients: ingredients)
  ingredients.each do |data|
    new_ingredient = Ingredient.find_or_create_by(name: data[:ingredient])
    Measure.find_or_create_by(ingredient: new_ingredient, drink: new_drink, unit: data[:unit], amount: data[:amount])
  end
end


#
# # Q-s
# # 1. How do we grab all indicidual ingredients and add them to our table?
# # 2. How do we associate categories to drinks programmatically?
#
#
# ##########################################
#
# # Users
# # ------------------------------------
# oleg = User.create(name: "Oleg")
# josh = User.create(name: "Josh")
#
# # Drinks
# # ------------------------------------
# # marg = Drink.create(name: "Margarita", image_url: "image_url")
# # of = Drink.create(name: "Old Fashioned", image_url: "image_url")
# # manhattan = Drink.create(name: "Manhattan", image_url: "image_url")
# # vrb = Drink.create(name: "Vodka Red Bull", image_url: "image_url")
#
#
# # Ingredients
# # ------------------------------------
# teq = Ingredient.create(name: "Tequilla")
# ts = Ingredient.create(name: "Triple Sec")
# lij = Ingredient.create(name: "Lime Juice")
# ss = Ingredient.create(name: "Simple Syrup")
# rye = Ingredient.create(name: "Rye Bourbon")
# bitters = Ingredient.create(name: "Aromatic Bitters")
# sv = Ingredient.create(name: "Sweet Vermouth")
# vodka = Ingredient.create(name: "Vodka")
# rb = Ingredient.create(name: "Red Bull")
#

# # Categories
# # ------------------------------------
# classic = Category.create(name: "Classic Cocktail")
# modern = Category.create(name: "Modern Cocktail")


# Associations
# ------------------------------------

# ## Drink-ingredients
# marg.ingredients << teq
# marg.ingredients << ts
# marg.ingredients << lij
# marg.ingredients << ss
#
# of.ingredients << rye
# of.ingredients << bitters
# of.ingredients << ss
#
# manhattan.ingredients << rye
# manhattan.ingredients << bitters
# manhattan.ingredients << sv
#
# vrb.ingredients << vodka
# vrb.ingredients << rb
#
# ## Categories
# classic.drinks << marg
# classic.drinks << of
# classic.drinks << manhattan
# modern.drinks << vrb
#
# ## User-drinks
# marg.users << josh
# of.users << josh
#
# of.users << oleg
# manhattan.users << oleg
# vrb.users << oleg
