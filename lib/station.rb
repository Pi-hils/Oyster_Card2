
class Station
attr_reader :name, :zone

    def initialize(name, zone)
      @name = name 
      @zone = zone
    end 


    def info
       ":zone" ":name"
    end
end