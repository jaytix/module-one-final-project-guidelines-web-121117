require 'rest-client'
require 'json'
require 'pry'


# cocktails_data = RestClient.get('https://raw.githubusercontent.com/teijo/iba-cocktails/master/recipes.json')
# cocktails_array = JSON.parse(cocktails_data)
#
# puts cocktails_array
#
#
# cocktails_array.each do |cocktails_array_element|
#   name = cocktails_array_element["name"]
#   category = cocktails_array_element["genres"]
#   rating = cocktails_array_element["rating"]["average"]
#   status = cocktails_array_element["status"]
#
#   TvShow.create(name: name, genre: genre, rating: rating, status: status)
# end


##########################################

# Users
# ------------------------------------
oleg = User.create(name: "Oleg")
josh = User.create(name: "Josh")

# Drinks
# ------------------------------------
marg = Drink.create(name: "Margarita", image_url: "image_url")
of = Drink.create(name: "Old Fashioned", image_url: "image_url")
manhattan = Drink.create(name: "Manhattan", image_url: "image_url")
vrb = Drink.create(name: "Vodka Red Bull", image_url: "image_url")


# Ingredients
# ------------------------------------
teq = Ingredient.create(name: "Tequilla")
ts = Ingredient.create(name: "Triple Sec")
lij = Ingredient.create(name: "Lime Juice")
ss = Ingredient.create(name: "Simple Syrup")
rye = Ingredient.create(name: "Rye Bourbon")
bitters = Ingredient.create(name: "Aromatic Bitters")
sv = Ingredient.create(name: "Sweet Vermouth")
vodka = Ingredient.create(name: "Vodka")
rb = Ingredient.create(name: "Red Bull")


# Categories
# ------------------------------------
classic = Category.create(name: "Classic Cocktail")
modern = Category.create(name: "Modern Cocktail")


# Associations
# ------------------------------------

## Drink-ingredients
marg.ingredients << teq
marg.ingredients << ts
marg.ingredients << lij
marg.ingredients << ss

of.ingredients << rye
of.ingredients << bitters
of.ingredients << ss

manhattan.ingredients << rye
manhattan.ingredients << bitters
manhattan.ingredients << sv

vrb.ingredients << vodka
vrb.ingredients << rb

## Categories
classic.drinks << marg
classic.drinks << of
classic.drinks << manhattan
modern.drinks << vrb

## User-drinks
marg.users << josh
of.users << josh

of.users << oleg
manhattan.users << oleg
vrb.users << oleg
