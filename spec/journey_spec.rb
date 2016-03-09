require 'journey'

describe Journey do
  let(:station_in) { double(:Station) }
  let(:station_out) { double(:Station) }
  subject(:journey) { described_class.new(entry_station: station_in, exit_station: station_out) }
  subject(:journey_with_no_entry) { described_class.new(entry_station: nil, exit_station: station_out) }
  subject(:journey_with_no_exit) { described_class.new(entry_station: station_in, exit_station: nil) }

    min_fare = described_class::MIN_FARE
    penalty_fare = described_class::PENALTY_FARE

  it 'has a starting point' do
    expect(journey.entry_station).to eq(station_in)
  end

  it 'has a ending point' do
    expect(journey.exit_station).to eq(station_out)
  end

  describe '#fare' do
      it 'is expected to return minimum fare if touched in and out corectly' do
        expect(journey.fare).to eq min_fare
      end

      it 'calculates a penalty fare if no entry station is logged' do
        expect(journey_with_no_entry.fare).to eq penalty_fare
      end

      it 'calculates a penalty fare if no exit station is logged' do
        expect(journey_with_no_exit.fare).to eq penalty_fare
      end
  end

end
