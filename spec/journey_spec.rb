require 'journey'

describe Journey do
  let(:station_in) { double(:Station) }
  let(:station_out) { double(:Station) }
  subject(:journey) { described_class.new station_in }
  subject(:journey_with_no_entry) { described_class.new nil }

  min_fare = described_class::MIN_FARE
  penalty_fare = described_class::PENALTY_FARE

  describe '#initialize' do

    it 'has a starting point' do
      expect(journey.entry_station).to eq(station_in)
    end

  end

  describe '#end_journey' do

      it 'has a ending point' do
        journey.end_journey station_out
        expect(journey.exit_station).to eq(station_out)
      end

  end

  describe '#fare' do

      it 'is expected to return minimum fare if touched in and out correctly' do
        journey.end_journey station_out
        expect(journey.fare).to eq min_fare
      end

      it 'calculates a penalty fare if no entry station is logged' do
        journey_with_no_entry.end_journey station_out
        expect(journey_with_no_entry.fare).to eq penalty_fare
      end

      it 'calculates a penalty fare if no exit station is logged' do
        journey.end_journey nil
        expect(journey.fare).to eq penalty_fare
      end
  end


end
