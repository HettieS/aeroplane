class Airport
    attr_reader :name, :default_capacity, :capacity, :plane_array, :at_full_capacity, :weather

    def initialize(name, default_capacity)
        @name = name
        @default_capacity = default_capacity
        @plane_array = []
    end

    def update_capacity(capacity)
        @default_capacity = capacity if capacity >= 0
    end

    def land(plane)
        generate_weather
        if plane_array.include?(plane.name)
            "Plane already in airport"
        elsif weather == "stormy"
            "Stormy weather - can't land plane"
        elsif at_full_capacity?
            "Airport full - landing aborted"
        else
            plane_array << plane.name
            "Plane #{plane.name} landed successfully"
        end
    end

    def take_off(plane)
        generate_weather
        if weather == "stormy"
            "Stormy weather - can't take off"
        elsif plane_array.include?(plane.name)
            plane_array.delete(plane.name)
            "Plane #{plane.name} take-off successful"
        else
            "Plane has already left or does not exist at this airport"
        end
    end

    def print_plane_list
        plane_array.empty? ? "There are currently no planes." : "Planes currently in airport:\n" + plane_array.join("\n")
    end

    def at_full_capacity?
        default_capacity == plane_array.length
    end

    def generate_weather
        weather_states = rand(1..10)

        if weather_states.between?(1,8)
            weather == "sunny"
        else
            weather == "stormy"
        end
        weather
    end 
end