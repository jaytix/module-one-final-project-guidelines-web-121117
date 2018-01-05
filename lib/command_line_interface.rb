require_relative "./pick_drink_from_list.rb" #may or may not work
require 'colorize'


class CommandLineInterface

  # Step 1. Greet the user
  def greet
    a = Artii::Base.new :font => 'slant'
    puts a.asciify('- IBA Cocktails -').colorize(:blue)
    puts "       Absorb liquid wonders into ultramicroscopic dens of your soul.".colorize(:red)
    puts ""
    puts "         --------------------------------------------------------- "
    puts "                       Ver. 0.0.1  |  Licence MIT "
    puts "                Copyright (C) 2017. FIS | web121117 | JO "
    puts "         --------------------------------------------------------- "
    puts "\nHello, and welcome to IBA Cocktails CLI."
    print "\nHow would you prefer to be addressed? "
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
    puts "\nIt is our utmost pleasere to host you here, #{name.capitalize}!".colorize(:green)
    print "\nDare to tickle your sensory geisthavens? [Y/n]: "
    input = gets.chomp
    input.to_s.downcase
    input
  end

  # Step 4. Greeting a new user with a random drink.
  def greeting_random_drink(up_for_drink_input)
    if up_for_drink_input.to_s.downcase == "y"
      random_drink_value = random_drink
      puts "\nWhat a great choice! You are imbibing: #{random_drink_value}.".colorize(:green)
      random_drink_value
    else
      puts "\nWe fail to believe that you are refusing to heal and confuse your soul. Please reconsider.".colorize(:green)
      print "\nAre you up for a drink? [Y/n]: "
      input = gets.chomp
      input.to_s.downcase
      greeting_random_drink(input)
    end
  end

  # helper y/n input method
  def y_n_input
    print "[Y/n]: "
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
    puts ""
    puts "\n     #{found_drink.name.upcase}".colorize(:red)
    puts "     ---------------------------------------"
    puts "\n     This is a(n) #{found_drink.category} concocted with #{display_ingredients(name)}."
    puts "\n     And this is how you make it: #{found_drink.preparation}"
    puts "     ---------------------------------------"
    found_drink
  end

  # Helper method display_ingredients(drink_name)
  def display_ingredients(drink_name)
    found_drink = Drink.all.find_by(name: drink_name)
    ingredients = found_drink.ingredients.map {|i| i.name }.join(", ")
    ingredients
  end

  # Helper method build_a_drink_by_id
  def build_a_drink_by_id(id)
    found_drink = Drink.all.find(id)
    puts ""
    puts "\n     #{found_drink.name.upcase}".colorize(:red)
    puts "     ---------------------------------------"
    puts "\n     This is a(n) #{found_drink.category} concocted with #{display_ingredients_by_id(id)}."
    puts "\n     And this is how you make it: #{found_drink.preparation}"
    puts "     ---------------------------------------"
  end

  # Helper method display_ingredients_by_id
  def display_ingredients_by_id(id)
    found_drink = Drink.all.find(id)
    ingredients = found_drink.ingredients.map {|i| i.name }.join(", ")
    ingredients
  end


  ########## Main Menu ##############
  def main_menu
    puts "\n      ################# MAIN MENU #################"
    table_data = [
      { :choice => "1.",  :matters => "Crawl through liquid paradise." },
      { :choice => "2.", :matters => "Consult a master mixologist." },
      { :choice => "3.", :matters => "Dive into your personal symphonic sublimity." },
      { :choice => "4.", :matters => "See the greatest concoction ever made." },
      { :choice => "5.", :matters => "Take a nighttime walk into oblivion." },
      { :choice => "6.", :matters => "Exit." }
    ]
    Formatador.display_table(table_data)
    puts "\nFind yourself gazing over the above options again by typing [menu]."
    # Input
    print "Make your choice [1-6]: "
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
      when input.to_i == 6
        puts "Cheers! Tara!"
        a = Artii::Base.new :font => 'slant'
        puts a.asciify('- IBA Cocktails -').colorize(:blue)
        puts "       Absorb liquid wonders into ultramicroscopic dens of your soul.".colorize(:red)
        puts ""
        puts "         --------------------------------------------------------- "
        puts "                       Ver. 0.0.1  |  Licence MIT "
        puts "                Copyright (C) 2017. FIS | web121117 | JO "
        puts "         --------------------------------------------------------- "
      when input.to_s == "menu"
        main_menu
      else
        puts "Input is invalid. Please choose again."
        main_menu
    end
  end

  def bartender_suggestion
    # What’s your base liquor? #negroni #of #daiquiri #sidecar #sazerac #moscow mule #margarita
    a = Artii::Base.new :font => 'slant'
    puts a.asciify('- VIP ZONE -').colorize(:red)
    puts "\nUnleash your delightful curiousity by chosing your poison:".colorize(:green)
    puts "\nVodka".colorize(:red)
    puts "Gin".colorize(:red)
    puts "Rum".colorize(:red)
    puts "Tequila".colorize(:red)
    puts "Whiskey".colorize(:red)
    puts "Cognac".colorize(:red)
    print "\nMy base liquor of choice is: "
    input = gets.chomp

    case input.to_s.downcase
      when "vodka"
        puts ""
        puts "A modern classic. Enjoy!".colorize(:green).colorize(:green)
        build_a_drink("Moscow Mule")
        yes_input = add_drink_to_favorites("Moscow Mule")
        if yes_input == "y" || yes_input == "Y"
          what_next
        end
      when "gin"
        puts ""
        puts "Can't go wrong with Negroni. Perfect balance.".colorize(:green)
        build_a_drink("Negroni")
        yes_input = add_drink_to_favorites("Negroni")
        if yes_input == "y" || yes_input == "Y"
          what_next
        end
      when "rum"
        puts ""
        puts "Enjoy the Hemingway's take on a classic daiquiri.".colorize(:green)
        build_a_drink("Hemingway Special")
        yes_input = add_drink_to_favorites("Hemingway Special")
        if yes_input == "y" || yes_input == "Y"
          what_next
        end
      when "tequila"
        puts ""
        puts "What else but a refreshing and tingy Margarita?".colorize(:green)
        build_a_drink("Margarita")
        yes_input = add_drink_to_favorites("Margarita")
        if yes_input == "y" || yes_input == "Y"
          what_next
        end
      when "whiskey"
        puts ""
        puts "Perfect choice. Here are two options:".colorize(:green)
        build_a_drink("Old Fashioned")
        add_drink_to_favorites("Old Fashioned")
        build_a_drink("Sazerac")
        yes_input = add_drink_to_favorites("Sazerac")
        if yes_input == "y" || yes_input == "Y"
          what_next
        end
      when "cognac"
        puts ""
        puts "Go back in time with this Jazz Age classic.".colorize(:green)
        build_a_drink("Sidecar")
        yes_input = add_drink_to_favorites("Sidecar")
        if yes_input == "y" || yes_input == "Y"
          what_next
        end
      when "exit"
        puts "Cheers! Tara!"
        a = Artii::Base.new :font => 'slant'
        puts a.asciify('IBA Cocktails')
        puts "                Ver. 0.0.1  |  Licence MIT "
        puts "         Copyright (C) 2017. FIS | web121117 | JO "
        puts "  --------------------------------------------------------- "
      else
        puts "Input is invalid. Please choose again."
        bartender_suggestion
    end

  end

  # helper method what_next
  def what_next
    puts "\n########### WHAT NEXT ###########"
    puts "\nWhat would you like to do next?"
    puts "1. Get another suggestion."
    puts "2. Go back to Main menu."
    puts "3. Exit."
    print "\nYour choice [1/2/3]: "
    input = gets.chomp

    case input.to_i
      when 1
        bartender_suggestion
      when 2
        main_menu
      when 3
        puts "Cheers! Tara!"
        a = Artii::Base.new :font => 'slant'
        puts a.asciify('- IBA Cocktails -').colorize(:blue)
        puts "       Absorb liquid wonders into ultramicroscopic dens of your soul.".colorize(:red)
        puts ""
        puts "         --------------------------------------------------------- "
        puts "                       Ver. 0.0.1  |  Licence MIT "
        puts "                Copyright (C) 2017. FIS | web121117 | JO "
        puts "         --------------------------------------------------------- "
      else
        puts "Input is invalid. Please choose again."
        what_next
    end
  end

  def add_drink_to_favorites(drink_name)
    print "\nWould you like to add this drink to your favourites? [Y/n]: "
    input = gets.chomp
    input.to_s.downcase

    case input
      when "y"
        drink = Drink.find_by(name: drink_name)
        drink.users << User.last
        puts "   _________________________________________________________".colorize(:green)
        puts "\n  |     #{drink_name} has been added to your favourites.      ".colorize(:green)
        puts "   _________________________________________________________".colorize(:green)
      when "n"
        puts "\nOK. Let's go to the Main menu."
        main_menu
      when "menu"
        main_menu
      when "exit"
        puts "Cheers! Tara!"
        a = Artii::Base.new :font => 'slant'
        puts a.asciify('IBA Cocktails')
        puts "                Ver. 0.0.1  |  Licence MIT "
        puts "         Copyright (C) 2017. FIS | web121117 | JO "
        puts "  --------------------------------------------------------- "
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
      puts "   _________________________________________________________".colorize(:green)
      puts "\n     Your personal alcosymphonic sublimity so far:      ".colorize(:green)
      puts ""
      puts "     #{favorite_drinks} ".colorize(:green)
      puts "   _________________________________________________________".colorize(:green)
    end
    puts "\nHeading back to navigation journal."
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
      puts "   _________________________________________________________".colorize(:green)
      puts "\n  |     The greatest concoction ever made is: #{most_popular.name}      ".colorize(:green)
      puts "   _________________________________________________________".colorize(:green)
      print "\nWould you like to know what #{most_popular.name} is? [Y/n]: "
      input = gets.chomp
      input.to_s.downcase

      case input
      when "y"
        built_drink = build_a_drink(most_popular.name)
        add_drink_to_favorites(built_drink.name)
        puts "\nWe are taking you back to navigation journal.".colorize(:green)
        main_menu
      when "n"
        puts "\nWe are taking you back to navigation journal.".colorize(:green)
        main_menu
      when "exit"
        puts a.asciify('- IBA Cocktails -').colorize(:blue)
        puts "       Absorb liquid wonders into ultramicroscopic dens of your soul.".colorize(:red)
        puts ""
        puts "         --------------------------------------------------------- "
        puts "                       Ver. 0.0.1  |  Licence MIT "
        puts "                Copyright (C) 2017. FIS | web121117 | JO "
        puts "         --------------------------------------------------------- "
      else
        puts "Input is invalid. Going back to main menu."
        main_menu
      end
  end

  # helper method to be used in popular_drink
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
    puts a.asciify('- Oblivion -')
    print "\nYou are at a point of no return. Are you consciously ready for it? [Y/n]: "
    input = gets.chomp
    input.to_s.downcase

    case input
    when "y"
      puts "\n You will be imbibing:"
      puts build_a_drink(random_drink)
      random_drink_loop
    when "get me out of here"
      puts "Alright, alright if you so desire. Get home safe!".colorize(:green)
      main_menu
    when "n"
      puts "You have been warned you were entering an infinite loop. There's no escape now.".colorize(:green)
      get_me_drunk
    else
      puts "Invalid input. Your head is spinning.".colorize(:green)
      get_me_drunk
    end
  end

  # helper method random_drink_loop
  def random_drink_loop
    print "\nAre you down for the next liquid adventure? [Y/n]: "
    input = gets.chomp
    input.to_s.downcase

    case input
    when "y"
      puts build_a_drink(random_drink)
      random_drink_loop
    when "n"
      puts "You have been warned you were entering an infinite loop. There's no escape now.".colorize(:green)
      random_drink_loop
    when "menu"
      main_menu
    when "get me out of here"
      puts "Alright, alright if you so desire. Get home safe!".colorize(:green)
      main_menu
    else
      puts "Invalid input. Your head is spinning.".colorize(:green)
      random_drink_loop
    end

  end



  def run
    greet_input = greet # => current user name
    create_user(greet_input)
    up_for_drink_input = are_you_up_for_drink(greet_input)
    random_drink_value = greeting_random_drink(up_for_drink_input)
    print "\nWould you like to know what #{random_drink_value} is? [Y/n]: "
    input = gets.chomp
    input.to_s.downcase
    if input == "y"
      built_drink = build_a_drink(random_drink_value)
      add_drink_to_favorites(built_drink.name)
      puts "\nNow that you licked the forbideen fruit, there is no way back.".colorize(:green)
      main_menu
    else
      puts "We thought you were a touch more inquisitive. Let's continue our journey."
      main_menu
    end
  end

end
