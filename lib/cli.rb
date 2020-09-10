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
    end

    def display_plant_info(plant)
        API.scrape_indi_plants(plant)
    end

end