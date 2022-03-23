require "./lib/aeroplane.rb"
require "pry"

RSpec.describe Aeroplane do
    name = "LF10"
    plane = described_class.new(name)

    context "build plane" do

        it "creates aeroplane with name" do
            expect(plane.name).to eql("#{name}")
        end
        
    end
end