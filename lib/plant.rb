class Plant

    @@all=[]
    attr_accessor :common_name

    def initialize(name)
        self.new = name[:common_name]
    end

    def self.all
        @@all
    end


    
end