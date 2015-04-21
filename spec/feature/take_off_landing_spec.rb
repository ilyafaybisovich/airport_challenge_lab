require 'airport'
require 'plane'
require 'weather'

# As a pilot
# So that I can arrive at my specified destination
# I would like to land my plane at the appropriate airport

# As a pilot
# So that I can set off for my specified destination
# I would like to be able to take off from the appropriate airport

feature 'airport can manage take-offs and landings' do
  let(:airport) { Airport.new }
  let(:plane) { Plane.new }


  scenario 'planes can land and get landed status' do
    allow(Weather).to receive(:stormy?) {false}
    expect(plane.status).to eq(:flying)
    expect { airport.land plane }.not_to raise_error
    expect(plane.status).to eq(:landed)
  end

  scenario 'planes can take off and get flying status' do
    allow(Weather).to receive(:stormy?) {false}
    expect { airport.land plane }.to change{ plane.status }.from(:flying).to(:landed)
    expect { airport.take_off plane }.to change{ plane.status }.from(:landed).to(:flying)
  end
end