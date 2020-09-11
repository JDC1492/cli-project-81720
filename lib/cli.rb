class CLI
    def greet
        #greet the user
        puts "Welcome to the Greenhouse!"
        puts ""
        puts "What plant information are you looking for?"
        #pulls the listings from the API class method.
        API.scrape_listings
        list_plants
        option
        
    end

    def list_plants
        Plants.all.each.with_index(1) do |plant, i|
            puts "#{i}. #{plant.name.upcase}"
            sleep(0.1)
        end
    end

    def option
        puts "Select a number for more information on that particular plant/tree. "
        input = gets.chomp
        #input needs to be in range of the options available, between 1-20.
        if !input.to_i.between?(1, Plants.all.count)
            puts ""
            puts "Option not availible. Please try another selection."
            list_plants
            option
        else
            plant = Plants.all[input.to_i-1]
            display_plant_info(plant)
        end
        #to keep the flow, I'm asking the user 
        #would they like to find out more about another plant option.
        puts ""
        puts ""
        puts "Eager to learn a few more facts about plants?" 
        puts "Enter Y or N"
        anot_select = gets.strip.downcase
        if anot_select == "y"
            #again, calling the methods to give the user 
            #the list of options and chance to input
            puts ""
            puts ""
            list_plants
            option
            plant = Plants.all[input.to_i-1]
            display_plant_info(plant)
        elsif anot_select == "n" 
            #closing the project with a corny poem
            puts "Hate to see you go..."
            puts ""
            sleep(1)
            puts " but with the knowledge you now know..."
            puts ""
            sleep(1)
            puts "  go be free, plant a tree..."
            puts ""
            sleep(1)
            puts "   be at peace while you watch it grow..."
            puts ""
            sleep(1)
            exit
        else
            puts "Is seems you've stumbled into a field of weeds..."
            puts "Please make another selection." 
            option
        end
    end

    def display_plant_info(plant)
        API.scrape_indi_plants(plant)
        puts""
        puts "A few details about the #{plant.name}."
        sleep(0.5)
        puts""
        puts "Scientific Name: #{plant.scientific_name}"
        sleep(0.5)
        puts""
        puts "Genus: #{plant.genus}"
        sleep(0.5)
        puts""
        puts "Observations: #{plant.observations}"
        sleep(0.5)
        puts""
        puts "Family: #{plant.family}"
        sleep(0.5)
        puts""
        puts "Edible: #{plant.edible}"
        sleep(0.5)
    end

end