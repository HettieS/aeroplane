require "pry"
require "./lib/airport.rb"

RSpec.describe Airport do
    context "build airport" do
        airport = described_class.new("London", 5)

        it "has default plane capacity" do
            expect(airport.default_capacity).to eql(5)
        end

        it "has an airport name" do
            expect(airport.name).to eql("London")
        end
    end

    context "update airport capacity" do
        airport = described_class.new("London", 5)
        airport.update_capacity(10)

        it "updates the airport capacity" do
            expect(airport.default_capacity).to eql(10)
        end
    end

    context "land" do
        airport = described_class.new("London", 5)
        plane = "TH10"
        subject { airport.land(plane) }

        it "lands plane successfully" do
            expect(subject).to eql("Plane #{plane} landed successfully")
            expect(airport.plane_array).to eql(["TH10"])
        end

        it "does not land when airport full" do
            airport = described_class.new("London", 1)
            plane = "TH10"
            plane2 = "HP05"
            
            airport.land(plane)
            expect(airport.land(plane2)).to eql("Airport full - landing aborted")
            expect(airport.plane_array).to eql(["TH10"])

        end
    end

    context "take-off" do
        airport = described_class.new("London", 5)

        it "takes off successfully" do
            airport.land("GE03")
            airport.land("HG07")
            expect(airport.take_off("GE03")).to eql("Plane GE03 take-off successful")
            expect(airport.plane_array).to eql(["HG07"])
        end
    end

    context "print plane list" do
        airport = described_class.new("London", 5)

        it "prints the list of planes in the airport" do
            allow(airport).to receive(:plane_array) { ["BA01", "BA02"] }
            expect(airport.print_plane_list).to eql("Planes currently in airport:\nBA01\nBA02")
        end

        it "returns correctly if there are no planes in airport" do
            allow(airport).to receive(:plane_array) { [] }
            expect(airport.print_plane_list).to eql("There are currently no planes.")      
        end

    end

    context "at_full_capacity?" do
        airport = described_class.new("London", 3)
        
        it "returns false when airport not at full capacity" do
            allow(airport).to receive(:plane_array) {["BA01", "BA02"]}
            expect(airport.at_full_capacity?).to be_falsey
        end

        it "returns true when airport is at full capacity" do
            allow(airport).to receive(:plane_array) {["BA01", "BA02", "GT03"]}
            expect(airport.at_full_capacity?).to be_truthy
        end
    end

end