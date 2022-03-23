require "./lib/airport.rb"

class Aeroplane

    attr_reader :name, :flight_status

    def initialize(name)
        @name = name
        @flight_status = flight_status
    end
end