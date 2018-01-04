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
  name = drinks_arr_element["name"] || ""
  category = drinks_arr_element["category"] || "Cocktail"
  ingredients = drinks_arr_element["ingredients"] || ""
  preparation = drinks_arr_element["preparation"] || ""
  new_drink = Drink.create(name: name.titleize, category: category.titleize, preparation: preparation)
  ingredients.each do |data|
    new_ingredient = Ingredient.find_or_create_by(name: data["ingredient"] || "")
    Measure.find_or_create_by(ingredient: new_ingredient, drink: new_drink, unit: data["unit"], amount: data["amount"])
  end
end

# Users
kevin = User.create(name: "Kevin")
nemanja = User.create(name: "Nemanja")
andrea = User.create(name: "Andrea")
tania = User.create(name: "Tania")
drew = User.create(name: "Drew")
julien = User.create(name: "Julien")
brianna = User.create(name: "Brianna")
mo = User.create(name: "Mo")
john = User.create(name: "John")
mark = User.create(name: "Mark")
joseph = User.create(name: "Joseph")
anna = User.create(name: "Anna")
matt = User.create(name: "Matt")
lindsay = User.create(name: "Lindsay")
josh = User.create(name: "Josh")
oleg = User.create(name: "Oleg")
kenny  = User.create(name: "Kenny")

# user-drinks associations
vesper = Drink.find(1)
negroni = Drink.find(2)
sazerac = Drink.find(51)
bellini = Drink.find(28)

bellini.users << brianna
bellini.users << tania
bellini.users << andrea
bellini.users << lindsay

sazerac.users << josh
sazerac.users << oleg
sazerac.users << john
sazerac.users << drew
sazerac.users << kevin
sazerac.users << mark
sazerac.users << matt

vesper.users << mo
vesper.users << anna
vesper.users << julien

negroni.users << kenny
negroni.users << joseph


# Drink image_urls
#
# "Vesper", https://static.vinepair.com/wp-content/uploads/2016/04/vesper-social.jpg
#
#  "Bacardi", https://assets.punchdrink.com/wp-content/uploads/2016/03/Article-Vodka-Cocktail-Recipe-Duke-Martini-London-Giuseppe-Gonzalez-Suffolk-Arms-Espresso-Martini-NYC.jpg
#
#  "Negroni", https://s3.us-east-2.amazonaws.com/chrissy-tuxedo-no2/1500x861recipe-negroni-cocktail-recipe.jpg
#
#  "Rose", https://fthmb.tqn.com/9qg4NgkPF8acN4dYeQVun6CzOPI=/1500x1000/filters:fill(auto,1)/english-rose-cocktail-56a170ea3df78cf7726aabb1.jpg
#
#  "Old Fashioned", https://media.timeout.com/images/102540240/image.jpg
#
#  "Tuxedo", https://static.vinepair.com/wp-content/uploads/2016/03/tuxedo-2-social.jpg
#
#  "Mojito", http://img-3.journaldesfemmes.com/HMSJtfpyW-36NKRkQ-ESZoClKc0=/750x/smart/d1d0e72ce1b244939598dccfc85d3a29/recipe-jdf/10025185.jpg
#
#  "Horse's Neck", https://assets.absolutdrinks.com/drinks/solid-background-black/soft-shadow/floor-reflection/415x655/horses-neck(85).jpg
#
#  "Planter's Punch", https://s3.us-east-2.amazonaws.com/chrissy-tuxedo-no2/1500x861planters_punch.jpg
#
#  "Sea Breeze", https://cdn.liquor.com/wp-content/uploads/2011/07/25145748/ultimate-vodka-cocktail.jpg
#
#  "Pisco Sour", https://media.timeout.com/images/103172545/image.jpg
#
#  "Long Island Iced Tea", https://images.kitchenstories.io/recipeImages/LongIslandIcedTea_4x3.jpg
#
#  "Clover Club", https://s3.us-east-2.amazonaws.com/chrissy-tuxedo-no2/1500x861recipe-clover-club-cocktail-recipe.jpg
#
#  "Angel Face", https://cdn.liquor.com/wp-content/uploads/2013/01/Angels-Face.jpg
#
#  "Mimosa", https://static1.squarespace.com/static/562e948ae4b0a84769fe6284/t/576b0267ebbd1aee23eb152c/1466630761734/the-cocktail-experiment-syrups-lavender-mimosa.png
#
#  "Whiskey Sour", https://fthmb.tqn.com/H45Jpgpvf8Ja7OPmij9aPoJPX64=/1500x1000/filters:no_upscale():fill(transparent,1)/SourVSCollins-GettyImages-128314031-56a175195f9b58b7d0bf73e9.jpg
#
#  "Screwdriver", https://cdn.liquor.com/wp-content/uploads/2012/03/stoli-o-main-squeeze.jpg
#
#  "Cuba Libre", https://www.yummy.co.ke/wp-content/uploads/2013/08/cuba-libre.jpg
#
#  "Manhattan", https://s3.us-east-2.amazonaws.com/chrissy-tuxedo-no2/1500x861recipe-manhattan-cocktail-recipe.jpg
#
#  "Porto Flip", https://i.pinimg.com/originals/2e/bd/10/2ebd10233f9580c6f2ce216809544e88.jpg
#
#  "Gin Fizz", https://s3.us-east-2.amazonaws.com/chrissy-tuxedo-no2/1500x861recipe-ramos-gin-fizz-cocktail-recipe.jpg
#
#  "Espresso Martini", https://cdn.liquor.com/wp-content/uploads/2016/09/16092441/espresso-martini-1200x628-social.jpg
#
#  "Margarita", https://cdn.liquor.com/wp-content/uploads/2012/05/23114430/Margaritas-By-the-pitcher-new.jpg
#
#  "French 75", https://www.cocktailcourier.com/wp-content/uploads/2014/12/Elder-is-Wiser-500x541.jpeg
#
#  "Yellow Bird", https://winedharma.com/sites/winedharma.com/files/imagecache/auto-768/story/1519-yellow-bird-cocktail-ricetta-originale-yellow-bird-cocktail-cocktail-con-rum-bianco.jpg
#
#  "Pina Colada", https://assets.punchdrink.com/wp-content/uploads/2016/08/Article-Pina-Colada-Pineapple-Coconut-Rum-Summer-Cocktail-Recipe.jpg
#
#  "Aviation", https://s3.us-east-2.amazonaws.com/chrissy-tuxedo-no2/1500x861recipe-aviation-cocktail-recipe.jpg
#
#  "Bellini", https://static.vinepair.com/wp-content/uploads/2016/03/bellini-social.jpg
#
#  "Grasshopper", https://static.vinepair.com/wp-content/uploads/2016/04/grasshopper-social.jpg
#
#  "Tequila Sunrise", https://static.vinepair.com/wp-content/uploads/2016/04/tequila-sunrise-social.jpg
#
#  "Daiquiri", https://static.vinepair.com/wp-content/uploads/2016/03/daiquiri-social.jpg
#
#  "Rusty Nail", https://static.vinepair.com/wp-content/uploads/2016/04/rusty-nail-social.jpg
#
#  "B52", http://en.grand-marnier.com/assets/en/cocktails/cocktails_withbarristab-52.jpg
#
#  "Stinger", https://media1.fdncms.com/chicago/imager/u/original/19056504/img_0383.jpg
#
#  "Golden Dream", https://farm1.staticflickr.com/581/20879130218_a3ff29084d_o.jpg
#
#  "God Mother", https://assets.absolutdrinks.com/drinks/solid-background-black/soft-shadow/floor-reflection/415x655/godmother(85).jpg
#
#  "Spritz Veneziano", https://upload.wikimedia.org/wikipedia/commons/thumb/5/59/Aperol_Spritz_2014a.jpg/768px-Aperol_Spritz_2014a.jpg
#
#  "Bramble", https://cdn.liquor.com/wp-content/uploads/2016/09/16091151/bramble-1200x628-social.jpg
#
#  "Alexander", http://honestlyyum.com/wp-content/uploads/2013/10/brandy.alexander.cocktail.recipe.2.1.jpg
#
#  "Lemon Drop Martini", https://mixthatdrink.com/wp-content/uploads/2011/04/lemon-drop-martini-fb.jpg
#
#  "French Martini", https://cdn.liquor.com/wp-content/uploads/2011/08/18172739/french-martini11.jpg
#
#  "Black Russian", http://cdn.liquor.com/wp-content/uploads/2017/03/30154637/black-russian-1200-628.jpg
#
#  "Bloody Mary", https://static.vinepair.com/wp-content/uploads/2016/03/bloody-mary-social.jpg
#
#  "Mai Tai", https://www.thecocktailproject.com/sites/default/files/8236_cruzan_mai_thai_beauty-6237_thumbnail.jpg
#
#  "Barracuda", https://assets.absolutdrinks.com/drinks/solid-background-black/soft-shadow/floor-reflection/415x655/barracuda(85).jpg
#
#  "Sex On The Beach", http://www.terrakulture.com/restnew/wp-content/uploads/2014/10/sex-onthe-beach.jpg
#
#  "Monkey Gland", http://www.scienceofdrink.com/wp-content/uploads/2009/02/monkey-gland-x-2.jpg
#
#  "Derby", https://www.thecocktailproject.com/sites/default/files/styles/standard-recipe-image-mobile/public/basic-makers-mark-the-brown-derby.jpg?itok=ufYAw1uU
#
#  "Sidecar", https://s3.us-east-2.amazonaws.com/chrissy-tuxedo-no2/1500x861recipe-sidecar-cocktail-recipe.jpg
#
#  "Irish Coffee", https://cdn.liquor.com/wp-content/uploads/2012/10/15120211/Irish-Coffee.jpg
#
#  "Sazerac", https://search.chow.com/thumbnail/800/600/www.chowstatic.com/assets/2014/11/11620_RecipeImage_vieux_carre_3000.jpg
#
#  "Americano", https://static.vinepair.com/wp-content/uploads/2016/03/americano-social.jpg
#
#  "Singapore Sling", https://static.vinepair.com/wp-content/uploads/2016/03/singapore-sling-social.jpg
#
#  "French Connection", https://cdn.liquor.com/wp-content/uploads/2013/01/27124203/fa-french_connection.jpg
#
#  "Moscow Mule", https://images.kitchenstories.io/recipeImages/MoscowMule_4x3.jpg
#
#  "John Collins", https://i1.wp.com/vervemagazine.co.nz/wp-content/uploads/2016/12/tom-collins85.jpeg?resize=415%2C570
#
#  "Kir", https://d1o50x50snmhul.cloudfront.net/wp-content/uploads/2016/11/30180000/gettyimages-515791177.jpg
#
#  "Mint Julep", https://assets.punchdrink.com/wp-content/uploads/2013/09/MintJulep.jpg
#
#  "Tommy's Margarita", https://assets.punchdrink.com/wp-content/uploads/2013/09/Margarita-Thumbnail.jpg
#
#  "Paradise", https://assets3.thrillist.com/v1/image/1711002/size/tmg-slideshow_l.jpg
#
#  "Dirty Martini", https://punchdrink.com/wp-content/uploads/2016/03/Article-Vodka-Cocktail-Recipe-Duke-Martini-London-Giuseppe-Gonzalez-Suffolk-Arms-Espresso-Martini-NYC1.jpg
#
#  "Champagne Cocktail", https://imagesvc.timeincapp.com/v3/mm/image?url=http%3A%2F%2Fcdn-image.foodandwine.com%2Fsites%2Fdefault%2Ffiles%2F2012-cocktails-HD-champagne-cocktail-2012-cocktails-c-champagne-cocktail.jpg&w=700&q=85
#
#  "Mary Pickford", http://barmansjournal.com/wp-content/uploads/2015/08/DSC_2226.jpg
#
#  "Hemingway Special", https://hips.hearstapps.com/edc.h-cdn.co/assets/16/03/1453492022-hemingway-daiquiri-1.jpg
#
#  "Dark 'N' Stormy", https://static1.squarespace.com/static/56bf8b007c65e42554984ef0/t/59291236cd0f6872ec35fec8/1495863869133/
#
#  "Ramos Fizz", https://assets.punchdrink.com/wp-content/uploads/2016/06/Recipe-Article-How-to-Make-Ramos-Gin-Fizz-Hacks-Gentilly-New-Orleans-Egg-White-Cocktail-NYC-Recipe-Boba.gif
#
#  "Russian Spring Punch", https://i.pinimg.com/originals/b0/48/97/b0489773a21b42a0a219b9d74e5899e8.jpg
#
#  "God Father", http://prime-living.com/downloads/754/download/TafferGodfather_520X320.jpg?cb=1316269bcc6f4d5a1f32103268d061b8
#
#  "Cosmopolitan", https://static.vinepair.com/wp-content/uploads/2016/03/cosmo-social.jpg
#
#  "Dry Martini", https://static.vinepair.com/wp-content/uploads/2016/03/gin-martini-social.jpg
#
#  "Between The Sheets", https://s3.us-east-2.amazonaws.com/chrissy-tuxedo-no2/1500x861recipe-between-the-sheets-cocktail-recipe.jpg
#
#  "Casino", https://www.thedrinkblog.com/wp-content/uploads/2015/02/tdb-casino-1500x1000-5.jpg
#
#  "Caipirinha", https://static.vinepair.com/wp-content/uploads/2016/04/caipirinha-social.jpg
#
#  "Vampiro", http://shake-that.com/wp-content/uploads/2015/07/Vampiro.jpg
#
#  "Kamikaze", https://upload.wikimedia.org/wikipedia/commons/thumb/b/bc/Kamikaze-cocktail.jpg/1200px-Kamikaze-cocktail.jpg
#
#  "White Lady", http://www.seriouseats.com/recipes/jan11_white_lady.jpg
#
#  "Harvey Wallbanger", https://static.vinepair.com/wp-content/uploads/2016/04/wallbanger-social.jpg

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
