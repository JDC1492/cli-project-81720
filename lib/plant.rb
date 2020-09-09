class Plants

    @@all=[]
    attr_accessor :name, :link

    def initialize(plant)
        self.name = plant[:common_name]
        self.link = plant[:links][:self]
        @@all<<self
    end

    def self.all
        @@all
    end


    
end


# treffle token: 7jharOHxyyJNNnPiuAkMe0EvzCR_F7MQkHt0S-1__LM