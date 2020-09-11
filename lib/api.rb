require 'pry'
class API 
    #constant being set with the APIs url for use of concatenation in the second method.
     URL='https://trefle.io/'

def self.scrape_listings 
    resp = RestClient.get('https://trefle.io/api/v1/plants?token=7jharOHxyyJNNnPiuAkMe0EvzCR_F7MQkHt0S-1__LM') 
        #site information to pull, setting it to the resp var through the use of the rest client gem.
    tref_hash = JSON.parse(resp.body, symbolize_names:true)
    tref_array = tref_hash[:data]
        #[:data] the beginning of the information that I want to pull and use.
    plant_id = tref_array.collect do |plant|
    
        Plants.new(plant) 
        #NewInstancesFromPlantClass.  
    end
end

def self.scrape_indi_plants(plant)
    token = '?token=7jharOHxyyJNNnPiuAkMe0EvzCR_F7MQkHt0S-1__LM'
        resp = RestClient.get(URL + plant.link + token)
        id_hash = JSON.parse(resp.body, symbolize_names:true)
        plant.scientific_name = id_hash[:data][:scientific_name]
        plant.genus = id_hash[:data][:genus]
        plant.observations = id_hash[:data][:observations]
        plant.family = id_hash[:data][:family]
        plant.edible = id_hash[:data][:edible]
end

end