require 'journey'

describe Journey do
  subject(:journey) { described_class.new station }
  let(:station) { double :station }

  describe "#initalize" do

    it 'gets initalized with a starting station' do
      expect(journey.starting_station).to eq station
    end

    it 'gets initalized with ending_station nil' do
      expect(journey.ending_station).to eq nil
    end

  end

  describe '#end_trip' do

    it 'set exit_station correctly' do
      journey.end_trip station
      expect(journey.ending_station).to eq station
    end

  end

  describe '#fare' do


    it 'return MIN_FARE when journey is complete' do
      journey.end_trip station
      expect(journey.fare).to eq described_class::MIN_FARE
    end

    it 'returns PENALTY_FARE when ending_station is nil' do
      journey.end_trip nil
      expect(journey.fare).to eq described_class::PENALTY_FARE
    end

    subject(:nil_start_journey) {described_class.new}

    it 'returns PENALTY_FARE when starting_station is nil' do
      nil_start_journey.end_trip station
      expect(nil_start_journey.fare).to eq described_class::PENALTY_FARE
    end

  end

end

# subject(:journey){described_class.new}
# let(:entry_station) { double :station }
# let(:exit_station) { double :station }
# let(:trip_start){{entry_station: entry_station}}
# let(:trip_end){{exit_station: exit_station}}
#
#
#
# it{expect(journey.trip).to eq ({})}
#
# it 'returns minimum fare when trip completed' do
#   journey.add_station(trip_start)
#   journey.add_station(trip_end)
#   expect(journey.fare).to eq Journey::MIN_FARE
# end
#
# it 'returns penalty fare when trip not completed' do
#   journey.add_station(trip_start)
#   expect(journey.fare).to eq Journey::PENALTY_FARE
# end
#
# it 'returns penalty fare when trip not started' do
#   journey.add_station(trip_end)
#   expect(journey.fare).to eq Journey::PENALTY_FARE
# end
