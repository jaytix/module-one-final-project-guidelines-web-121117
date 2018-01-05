def pick_drink_from_list
  Drink.all.map {|drink| puts "#{drink.id}. #{drink.name}"}
  print "Please choose a drink by number: "
  input = gets.chomp

  if 1 <= input.to_i && input.to_i <= 77
    build_a_drink_by_id(input)
    main_menu
  elsif input.to_s == "menu"
    main_menu
  elsif input.to_s == "exit"
    puts "Cheers! Tara!"
    a = Artii::Base.new :font => 'slant'
    puts a.asciify('IBA Cocktails')
  else
    puts "Invalid input. Please try again."
    pick_drink_from_list
  end

end
