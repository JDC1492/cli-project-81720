class CLI
    def greet
        puts "Welcome to the Greenhouse!"
        puts "What plant information are you looking for?"
        API.scrape_listings
        list_plants
    end

    def list_plants
        Plants.all.each.with_index(1) do |plant, i|
            puts "#{i}. #{plant.name.upcase}"
            sleep(0.5)
        end
    end
end