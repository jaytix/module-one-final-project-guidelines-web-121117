require_relative "./pick_drink_from_list.rb" #may or may not work

class CommandLineInterface

  # Step 1. Greet the user
  def greet
    a = Artii::Base.new :font => 'slant'
    puts a.asciify('IBA Cocktails')
    puts "Hello, and welcome to IBA Cocktails CLI."
    print "What’s your name? "
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
      puts "Are you up for a drink?"
      input = y_n_input
      greeting_random_drink(input) # looping back to the Step 3 question/method
      # loop doesn't work
    end
  end


  # helper y/n input method
  def y_n_input
    print "y/n: "
    input = gets.chomp
    input.to_s.downcase
  end

  # Helper method - random_drink
  def random_drink
    Drink.all.sample.name
  end

  # Helper method build_a_drink
  def build_a_drink(name)
    found_drink = Drink.all.find_by(name: name)
    puts "\n #{found_drink.name.upcase}"
    puts "\nThis is a(n): #{found_drink.category}"
    puts "\nHere are the ingredients: #{display_ingredients(name)}"
    puts "\nAnd this is how you make it: #{found_drink.preparation}"
    found_drink
  end

  def build_a_drink_by_id(id)
    found_drink = Drink.all.find(id)
    puts "\n #{found_drink.name.upcase}"
    puts "\nThis is a(n): #{found_drink.category}"
    puts "\nHere are the ingredients: #{display_ingredients_by_id(id)}"
    puts "\n#{found_drink.preparation}"
  end

  # Helper method display_ingredients(drink_name)
  def display_ingredients(drink_name)
    found_drink = Drink.all.find_by(name: drink_name)
    ingredients = found_drink.ingredients.map {|i| i.name }.join(", ")
    ingredients
  end

  # Helper method display_ingredients(drink_name)
  def display_ingredients_by_id(id)
    found_drink = Drink.all.find(id)
    ingredients = found_drink.ingredients.map {|i| i.name }.join(", ")
    ingredients
  end


  ########## Main Menu ##############
  def main_menu
    puts "\n            ########### MAIN MENU ###########"
    table_data = [
      { :number => "1.",  :option => "Pick a drink from the drinks list." },
      { :number => "2.", :option => "Get a drink suggestion from a bartender." },
      { :number => "3.", :option => "See your favorite drinks list." },
      { :number => "4.", :option => "See what the most popular drink is." },
      { :number => "5.", :option => "Enter GET ME DRUNK mode." }
    ]
    Formatador.display_table(table_data)
    puts "\nYou can return to main menu anytime by typing [menu]."
    puts "You can exit anytime by typing [exit]."
    # Input
    print "Choose a number: "
    input = gets.chomp
    input

    case
    when input.to_i == 1
      pick_drink_from_list
    when input.to_i == 2
      bartender_suggestion
    when input.to_i == 3
      see_user_favorite_drinks
    when input.to_i == 4
      popular_drink
    when input.to_i == 5
      get_me_drunk
    when input.to_s == "menu"
      main_menu
    when input.to_s == "exit"
      puts "Cheers! Tara!"
      a = Artii::Base.new :font => 'slant'
      puts a.asciify('IBA Cocktails')
    else
      puts "Input is invalid. Please choose again."
      main_menu
    end
  end

  def bartender_suggestion
    # What’s your base liquor? #negroni #of #daiquiri #sidecar #sazerac #moscow mule #margarita
    puts "\nChoose your base liquor:"
    puts "\nVodka"
    puts "\nGin"
    puts "\nRum"
    puts "\nTequila"
    puts "\nWhiskey"
    puts "\nCognac"
    print "Type in your choice: "
    input = gets.chomp

    case input.to_s.downcase
    when "vodka"
      puts "Modern classic. Enjoy!"
      build_a_drink("Moscow Mule")
      add_drink_to_favorites("Moscow Mule")
      what_next
    when "gin"
      puts "Can't go wrong with Negroni. Perfect balance."
      build_a_drink("Negroni")
      add_drink_to_favorites("Negroni")
      what_next
    when "rum"
      puts "Enjoy the Hemingway's take on a classic daiquiri."
      build_a_drink("Hemingway Special")
      add_drink_to_favorites("Hemingway Special")
      what_next
    when "tequila"
      puts "What else but a refreshing and tingy Margarita?"
      build_a_drink("Margarita")
      add_drink_to_favorites("Margarita")
      what_next
    when "whiskey"
      puts "Perfect choice. Here are two options:"
      build_a_drink("Old Fashioned")
      add_drink_to_favorites("Old Fashioned")
      build_a_drink("Sazerac")
      add_drink_to_favorites("Sazerac")
      what_next
    when "cognac"
      puts "Go back in time with this Jazz Age classic."
      build_a_drink("Sidecar")
      add_drink_to_favorites("Sidecar")
      what_next
    when "exit"
      puts "Cheers! Tara!"
      a = Artii::Base.new :font => 'slant'
      puts a.asciify('IBA Cocktails')
    else
      puts "Input is invalid. Please choose again."
      bartender_suggestion
    end

  end # give user an option to return to main menu or back to suggestions

  # helper method what_next
  def what_next
    puts "\n########### WHAT NEXT ###########"
    puts "\nWhat would you like to do next?"
    puts "1. Get another suggestion."
    puts "2. Go back to main menu."
    puts "3. Exit."
    print "\nEnter 1, 2 or 3: "
    input = gets.chomp

    case input.to_i
    when 1
      bartender_suggestion
    when 2
      main_menu
    when 3
      puts "Cheers! Tara!"
      a = Artii::Base.new :font => 'slant'
      puts a.asciify('IBA Cocktails')
    else
      puts "Input is invalid. Please choose again."
      what_next
    end
  end

  def add_drink_to_favorites(drink_name)
    puts "\nWould you like to add this drink to your favourites?"
    print "\nType y/n: "
    input = gets.chomp
    input.to_s.downcase

    case input
    when "y"
      drink = Drink.find_by(name: drink_name)
      drink.users << User.last
      puts "#{drink_name} was added to your favourites."
    when "n"
      puts "OK. Let's go to the Main Menu"
    when "menu"
      main_menu
    when "exit"
      puts "Cheers! Tara!"
      a = Artii::Base.new :font => 'slant'
      puts a.asciify('IBA Cocktails')
    else
      puts "Input is invalid. Please choose again."
      add_drink_to_favorites(drink_name)
    end
  end

  def see_user_favorite_drinks
    favorite_drinks = User.last.drinks.map { |drink| drink.name }.uniq.join(", ")
    if favorite_drinks.length < 1
      puts "You have not saved any drinks."
    else
      puts "\nYour favorite drinks so far:"
      puts ""
      puts favorite_drinks
    end
    puts "Going back to main menu now."
    main_menu
  end

  def popular_drink
    hash = Hash.new(0)
    UserDrink.all.each do |drink_instance|
    if hash[drink_instance.drink_id]
      hash[drink_instance.drink_id] += 1
    else
      hash[drink_instance.drink_id] = 1
    end
   end
   most_popular = Drink.all.find(largest_hash_key(hash))
   puts "\nThe most popular drink is: #{most_popular.name}"
   main_menu
  end

  def largest_hash_key(hash)
    current_highest_id = ""
    current_highest = 0
    hash.each do |k,v|
      if v > current_highest
        current_highest = v
        current_highest_id = k
      end
    end
    current_highest_id
  end

  def get_me_drunk
    a = Artii::Base.new :font => 'slant'
    puts a.asciify('Whoop! Whoop!')
    puts "\nAre you sure you are ready for it?"
    print "\nType "
    input = y_n_input # => .to_s.downcase

    case input
    when "y"
      puts "\n You will be drinking:"
      puts build_a_drink(random_drink)
      random_drink_loop
    when "exit"
      puts "Cheers! Tara!"
      a = Artii::Base.new :font => 'slant'
      puts a.asciify('IBA Cocktails')
    when "n"
      puts "You have been warned that you enter GET ME DRUNK mode. there's no escape."
      get_me_drunk
    else
      puts "It's not an option. Please get your mind straight."
      get_me_drunk
    end
  end

  # helper method random_drink_loop
  def random_drink_loop
    puts "\nAre you down for the next one?"
    print "\nType "
    input = y_n_input # => .to_s.downcase

    case input
    when "y"
      puts build_a_drink(random_drink)
      random_drink_loop
    when "menu"
      main_menu
    when "exit"
      puts "Cheers! Tara!"
      a = Artii::Base.new :font => 'slant'
      puts a.asciify('IBA Cocktails')
    else
      puts "Input is invalid. Please get your mind straight."
      random_drink_loop
    end

  end


  def run
    greet_input = greet # => current user name
    create_user(greet_input)
    up_for_drink_input = are_you_up_for_drink(greet_input)
    random_drink_value = greeting_random_drink(up_for_drink_input) # infinite loop for NO is not working
    puts "\nWould you like to know what #{random_drink_value} is?"
    answer = y_n_input
    if answer == "y"
      built_drink = build_a_drink(random_drink_value)
      puts "\nNow that you are a little tipsy, let’s move on to the main menu."
      add_drink_to_favorites(built_drink.name)
      main_menu
    else
      puts "We thought you were a touch more inquisitive. But that's ok, let's move on."
      main_menu
    end
  end

end
