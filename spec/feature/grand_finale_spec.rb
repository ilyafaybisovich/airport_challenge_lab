require 'capybara/rspec'

## Note these are just some guidelines!
## Feel free to write more tests!!

# Given 6 planes, each plane must land.
# Be careful of the weather, it could be stormy!
# Check when all the planes have landed that they have status "landed"
# Once all planes are in the air again, check that they have status "flying!"

feature 'Grand Finale' do
  let(:airport) { Airport.new }
  before(:each) do
    allow(Weather).to receive(:stormy?) { false }
  end
  scenario 'all planes can land and all planes can take off' do
    planes = []
    10.times { planes << Plane.new }
    planes.each do |plane|
      airport.land plane
    end
    expect(planes).to be_all { |plane| plane.status == :landed }
    planes.each do |plane|
      airport.take_off plane
    end
    expect(planes).to be_all { |plane| plane.status == :flying }
  end

end
