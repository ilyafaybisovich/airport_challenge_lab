require 'airport'
require 'plane'

feature 'traffic control prevents planes from landing' do
  let(:airport) { Airport.new }
  let(:plane) { Plane.new }

  scenario 'when the airport is full' do
    allow(Weather).to receive(:stormy?) { false }
    airport.size = 1
    airport.land plane
    p airport.planes
    plane_2 = Plane.new
    expect { airport.land plane_2 }.to raise_error "Can't land, airport full."
  end

  scenario 'when the weather is stormy' do
    allow(Weather).to receive(:stormy?) { true }
    expect { airport.land plane }.to raise_error "Can't land, weather is bad."
  end
end