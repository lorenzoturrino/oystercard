require 'journey_log'
describe JourneyLog do

  subject(:journey_log) {described_class.new(journey_class)}
  let(:journey_class) {double :Journey, new: journey}
  let(:journey) {double :journey, add_exit_station: nil}
  let(:station) {double :station}

  describe '#start_new_journey' do
    it 'creates a new journey instances' do
      expect(journey_class).to receive(:new).with(station)
      journey_log.start_new_journey(station)
    end

    it 'stores new journey in current journey' do
      journey_log.start_new_journey(station)
      expect(journey_log.current_journey).to eq journey
    end

  end

  describe '#close_current_journey' do

  before(:each) do
    journey_log.start_new_journey(station)
  end

    it 'store the completed journey in the log' do
      expect{journey_log.close_current_journey(station)}.to change{journey_log.journey_log.size}.by(1)
    end

    it 'sets the current journey to nil' do
      journey_log.close_current_journey(station)
      expect(journey_log.current_journey).to eq nil
    end

    it 'store the end station in the journey instance' do
      expect(journey).to receive(:add_exit_station).with(station)
      journey_log.close_current_journey(station)

    end

  end


  describe '#outstanding_fares' do

    it 'calls the #fare method on the last instance of journey' do
      journey_log.start_new_journey station
      journey_log.close_current_journey station
      expect(journey).to receive(:fare)
      journey_log.outstanding_fares
    end

  end


end
