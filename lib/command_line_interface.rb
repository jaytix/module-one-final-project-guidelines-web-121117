class CommandLineInterface

  # Step 1. Greet the user
  def greet
    puts "Hello, welcome. What’s your name?" # add user name to greeting
    input = gets.chomp
    input.to_s.downcase
    input
  end

  # Step 2. Create new user with input return.
  def create_user(input)
    User.create(name: input)
  end

  # Step 3. Ask a question:
  def are_you_up_for_drink(name)
    puts "Hello #{name.capitalize}! Are you up for a drink?"
    print "y/n: "
    input = gets.chomp
    input.to_s.downcase
    input
  end

  # Step 4. Greeting a new user with a random drink.
  def greeting_random_drink(up_for_drink_input)
    if up_for_drink_input.to_s.downcase == "y"
      random_drink_value = random_drink
      puts "\nYou are drinking: #{random_drink_value}." # helper method
      random_drink_value
    else
      puts "\nAre you serious? Why are you even using this app, then? Think again."
      are_you_up_for_drink # looping back to the Step 3 question/method
    end
  end

  # Helper method - random_drink
  def random_drink
    Drink.all.sample.name
  end

  # Helper method build_a_drink
  def build_a_drink(name)
    found_drink = Drink.all.find_by(name: "name")
    puts found_drink.name.upcase
    puts "This is a(n): #{found_drink.category}"
    puts "Here are the ingredients: #{display_ingredients(name)}"
  end

  # Helper method display_ingredients(drink_name)
  def display_ingredients(drink_name)
    found_drink = Drink.all.find_by(name: drink_name)
    ingredients = found_drink.map {|i| i.name }.join(", ")
    ingredients
  end


  ########## Main Menu ##############
  def main_menu
    puts "\n########### MAIN MENU ###########"
    puts "\n1. Pick a drink from the drinks list."
    puts "2. Get a drink suggestion."
    puts "3. See what the most popular drink is."
    puts "4. Get a drink suggestion from a bartender." # What’s your base liquor? #negroni #of #daiquiri #sidecar #sazerac #moscow mule #margarita
  end

  def run
    greet_input = greet
    create_user(greet_input)
    up_for_drink_input = are_you_up_for_drink(greet_input)
    random_drink_value = greeting_random_drink(up_for_drink_input) # infinite loop for NO is not working
    puts "\nWould you like to know what #{random_drink_value} is?"
    puts "\nNow that you are a little tipsy, let’s move on to the main menu."
    main_menu
  end

end
