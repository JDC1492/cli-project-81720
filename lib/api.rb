require 'pry'
class API 
    #constant being set with the APIs url.
     URL='https://trefle.io/'

def self.scrape_listings
   
    resp = RestClient.get('https://trefle.io/api/v1/plants?token=7jharOHxyyJNNnPiuAkMe0EvzCR_F7MQkHt0S-1__LM') 
        #site information to pull, setting it to the resp var through the use of the rest client gem.
    tref_hash = JSON.parse(resp.body, symbolize_names:true)
    tref_array = tref_hash[:data]
        # [:data] the beginning of the information that I want to pull and use.
    plant_id = tref_array.collect do |plant|
        Plants.new(plant) 
        # new instances from Plant class.  
    end
end

def self.scrape_indi_plants(plant_option)
    # 
   
    token = '?token=7jharOHxyyJNNnPiuAkMe0EvzCR_F7MQkHt0S-1__LM'

    plant_id.each do |p_id| 
        resp = RestClient.get(URL + p_id.link + token)
        id_hash = JSON.parse(resp.body, symbolize_names:true)
    # binding.pry
        p_id.scientific_name = id_hash[:data][:scientific_name]
        p_id.genus = id_hash[:data][:genus]
        p_id.observations = id_hash[:data][:observations]
        p_id.family = id_hash[:data][:family]
        p_id.edible = id_hash[:data][:edible]
    end
end

end