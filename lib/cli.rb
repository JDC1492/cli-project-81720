class CLI
    def greet
        #greet the user
        puts "Welcome to the Greenhouse!"
        puts "What plant information are you looking for?"
        #pulls the listings from the API class method.
        API.scrape_listings
        list_plants
        input
        
    end

    def list_plants
        Plants.all.each.with_index(1) do |plant, i|
            puts "#{i}. #{plant.name.upcase}"
            sleep(0.1)
        end
    end

    def input
        puts "Select a number for more information on that particular plant/tree. "
        input = gets.chomp
        #input needs to be in range of the options available, between 1-20.
        if !input.to_i.between?(1, Plants.all.count)
            puts "Option not availible. Please try another selection."
            list_plants
            input
        else
            plant = Plants.all[input.to_i-1]
            display_plant_info(plant)
        end
        #to keep the flow, I'm asking the user 
        #would they like to find out more about another plant option.
        puts "Eager to learn a few more facts about plants?"
        puts "Enter Y or N"
        anot_select = gets.strip.downcase
        if anot_select == "y"
            #again calling the methods to give the user 
            #the list of options and chance to input
            list_plants
            input
        else 
            #closing the project with a corny poem
            puts "Hate to see you go..."
            puts " but with the knowledge you now know..."
            puts "  go be free, plant a tree..."
            puts "   be at peace while you watch it grow..."
            sleep(0.3)
            exit
        end

    end

    def display_plant_info(plant)
        API.scrape_indi_plants(plant)
        puts "Just some minor details about the #{plant.name}"
        puts "Scientific Name: #{plant.scientific_name}" 
        puts "Genus: #{plant.genus}"
        puts "Observations: #{plant.observations}"
        puts "Family: #{plant.family}"
        puts "Edible: #{plant.edible}"
    end

end