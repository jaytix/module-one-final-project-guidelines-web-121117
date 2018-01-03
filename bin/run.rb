require_relative '../config/environment'

# Get rid of SQL debug messages.
ActiveRecord::Base.logger.level = 1

cocktails_data = RestClient.get('https://raw.githubusercontent.com/teijo/iba-cocktails/master/recipes.json')
cocktails_array = JSON.parse(cocktails_data)

# puts cocktails_array

name = cocktails_array_element["name"]
