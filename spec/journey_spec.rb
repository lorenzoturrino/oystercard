require 'journey'

describe Journey do
  let(:station_in) { double(:Station) }
  let(:station_out) { double(:Station) }
  subject(:journey) { described_class.new station_in , station_out }

  it 'has a starting point' do
    expect(journey.entry_station).to eq(station_in)
  end

  it 'has a ending point' do
    expect(journey.exit_station).to eq(station_out)
  end

end
